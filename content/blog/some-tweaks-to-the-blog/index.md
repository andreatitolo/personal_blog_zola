+++
title = "Some tweaks to the blog"
date = "2023-07-02"
draft = false
[taxonomies]
tags = [ "personal", "web", "11ty" ]

+++

This week and the past one I felt like I didn't want to write, and that's ok. I didn't open this blog in order to create content for people, but for myself. However, I still wanted to play around with the website and see if I could tweak and implement stuff that I saw around the internet. Here are some changes I implemented.

## Tweaked dates in post lists

Instead of only the month, now the blog list on the [Homepage](/) and in the [Archive](/blog/) shows the day too. It makes more sense to me.

## Reply via email button!

I firstly saw this on [Kev Quirk's blog](https://kevquirk.com) and I liked the idea. It is an easy and clean implementation without the need for a comment engine or a database. I tried to style the reply button to be more in line with the overall style here. You can see it at the end of this page, for now it's pretty neat!

p.s. the post footer was also a bit tweaked to better highlight the next/previous post section.

## Visual hint for current page on footer

This was only implemented on the header in the [eleventy starter blog](https://github.com/11ty/eleventy-base-blog) through this:

```html
{% raw %}<ul class="nav">
{%- for entry in collections.all | eleventyNavigation %}
    <li class="nav-item"><a href="{{ entry.url }}"{% if entry.url == page.url %} aria-current="page"{% endif %}>{{ entry.title }}</a></li>
{%- endfor %} 
</ul>{% endraw %}
```
The process through which I was adding elements to the footer before was manually listing the pages that I wanted there. However in that way I could not add an active navigation state easily to the visited page ([this solution](https://bryanlrobinson.com/blog/using-nunjucks-if-expressions-to-create-an-active-navigation-state-in-11ty/) did not work for me).

The answer was simpler than I thought, since the `<li>` elements were added in the header through an [Eleventy Collection](https://www.11ty.dev/docs/collections/), I leveraged those specifically. I added a tag `header` for pages that will go in the header, and `footer` for pages that will go in the footer, and then changed the code above to only get `collections.header` or `collections.footer` like this:

```html
<!-- Footer -->
<ul class="nav">
{% raw %}{%- for entry in collections.footer | eleventyNavigation %}
    <li class="nav-item"><a href="{{ entry.url }}"{% if entry.url == page.url %} aria-current="page"{% endif %}>{{ entry.title }}</a></li>
{%- endfor %}
    <li class="nav-item"><a href="/feed/feed.xml">RSS</a></li>
</ul>{% endraw %}
```
Side note: since I was creating two new tags I also had to avoid showing them in the [Tags page](/tags/). I did this by editing the eleventy filter already present in `eleventy.config.js`:

```js
eleventyConfig.addFilter("filterTagList", function filterTagList(tags) {
  return (tags || []).filter(tag => ["all", "nav", "post", "posts", "header", "footer"].indexOf(tag) === -1);
});
```

I like this solution! now if I want to add/remove elements from the footer or headers, I just need to edit the tags and they will update automatically.

## Uses page

Finally I managed to take the time and populate my [Uses](/uses/) page! While this is technically done by developers, I still think it might be useful to have one.

## Style tweaks

I tweaked some css-related stuff. I did not account very much for dark mode in the beginning. I tweaked some colors before but I forgot the svg icon in the header, which until now looked like this:

{{ image(src="header_old.webp" alt="old header style", class = "img-centered", caption = "") }}

Now it should look better with a rounded white background (the laziest solution, I know). I also darkened the blue a little bit to be less bright, the picture below doesn't really do justice but the text is still clear imho.

{{ image(src="header_new.webp" alt="new header style", class = "img-centered", caption = "") }}

## Meta

Other minor miscellaneous changes
- I updated the readme on the github repo.
- Updated the license on the repo as well.

## Future tweaks

There are other things I want to try in the future. For example, I don't really like the absence of a copy button on code blocks. However, for now, all the implementations I saw, are a bit beyond my current knowledge of javascript to implement them in a reliable way.