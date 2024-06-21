+++
title = "Rebuilding my academic website with Zola"
description = "Goodbye rstudio/blogdown/hugo stack!"
date = "2024-02-17"
updated = "2024-06-21"
draft = false
[taxonomies]
tags = [ "academic website", "zola", "webdev" ]
[extra]
toc_set = 1
+++

Yep, it's one of those blog posts. However, **this is not a guide**, I think it would be beneficial if there were more guides for Zola, but that's a thing for another time. The redesigned website is available at the old url: [https://www.andreatitolo.com](https://www.andreatitolo.com).

**Update 2024-06-21**: I deprecated my VPS, so the things described in the [New Forge](#new-forge) chapter are not totally true anymore regarding VPS and hosting, but the part about push mirrors, netlify and such are still valid.

**TLDR**
- I wanted to change my bloated academic website and move away from the hugo/academic/blogdown stack.
- I chose Zola as my static site generator.
- [The website](https://www.andreatitolo.com) is now faster, lighter, more sustainable and accessible.

## Background

I've recently delved a lot more of my free time in playing around with HTML and CSS. I like it a lot and I hope to dive more and more into it. As many online courses that I followed had suggested, the best practice is doing. This is also why I built this blog with Eleventy, to be kind of "forced" to use HTML and CSS directly.

I wanted to change my academic website for a long time now. It was fun at the beginning (almost 4 years ago) to use the combination of RStudio, Hugo and Blogdown to publish stuff, and at the time I needed something simple to get started. However, the workflow became a chore, I moved away from RStudio, and I grew to dislike not having full control on what I am doing with my website. The academic theme I used for Hugo is also a bloated mess, and the more I dived into web development, the more I understood how bloated it is and how much of that stuff I don't need. Plus, academic (Wowchemy for a time and now Hugo Blox or something) has become more of a CMS than a theme, I was running a very old version of that to keep things as they were (plus an old version of hugo too). I am expecting things to break sooner or later and I don't want to deal with the repairing, because once again, not having true control of how the website was build means I have no real clue how to fix stuff or where to look (note: this is an issue of the theme and how it was spearheaded by R enthusiasts at the time, not a Hugo issue). 

## Alternatives

So around September more or less, I started looking for alternatives (spoiler: there is a [huge amount of options](https://jamstack.org/generators/) - apparently [460](https://staticsitegenerators.net/)). I did a first try with Eleventy, as it was also the most familiar to me at the time. It was a lot of fun and I learned a lot. I actually came to an almost complete version of the website with it ([source code](https://archaeo.cc/forgejo/andreatitolo/draft_academic_website_11ty)), but then I dropped the idea around December.

In the last months I started to understand that I wanted less friction in the things I use, and to use less things requiring dozens of external or third party plugins to meet my need, hours of configuration, constant maintenance, and so on (I will talk about this sooner or later). In the end I wanted something open-source, easy, that does one thing well and with the less possible friction for me. Plus I didn't really need all the power Eleventy offers: academic website (not blogs) are probably the most statics of static sites. It is kind of ironic that I am using eleventy (built around plugins) for this blog, but I will probably change soon.

I started searching static site generators with these requirements: no plugins, ease of use, single binary, less maintenance for the future. Quarto was excluded at the beginning because it still seems quite hard and insane to do original and different website with it. I looked at Hugo again with the idea of building a custom theme, but honestly it was already hard (but fun) to improve my html and css knowledge, I really didn't want to deal with learning the Go syntax that Hugo uses. Plus the amount of information it threw at me while looking at the documentation felt overwhelming. While there were many other options (Pelican, and others), I found an [old Hacker News thread](https://news.ycombinator.com/item?id=17951110) complaining about Hugo un-friendliness (I was a bit frustrated), and someone linked an SSG under development, called Gutenberg. The name changed after a while and here we arrive at Zola, my ssg of choice.

## Zola

Zola is intended to be a friendlier Hugo-like ssg, it's built in Rust, so it doesn't really lose speed compared to Hugo. Again, I don't build 20 years old blogs with thousands of posts, so I don't really need that speed, but it's nice to have. Zola uses a sane and easy to grasp templating engine called [Tera](https://keats.github.io/tera/). Tera is  written in Rust as well, and inspired by Jinja2/Django, which is also what inspired Nunjucks (or was it Liquid?), the templating engine I am using in Eleventy. So, almost identical syntax, almost no learning curve, win-win. Plus, Zola docs are extensive but not overwhelming (although they could be more complete with some real-world examples). The [getting started guide](https://www.getzola.org/documentation/getting-started/overview/#first-steps-with-zola) is easier than Hugo's without the need to install a theme right away or to follow [an external guide on a blog](https://www.brycewray.com/posts/2022/07/really-getting-started-hugo/) to understand how everything works in the background. Tera has clear and simple documentation as well, which add to the benefits of using it.

Zola's configuration is easy and uses [TOML](https://toml.io/en/) both in the config file and in the markdown frontmatter. While I was bit skeptical (being used to YAML), I grew to like TOML, I think it's also easier to generate TOML content through shell scripts compared to YAML. All the things I need are there in the config file and enabling/disabling it is just a matter of changing one setting. Generating a feed is just setting the `generate_feed` option to `true` and that's it. Compare this to what needs to be done with Eleventy if you're not using a starter (again, not 11ty's fault, it's just not what I need). Everything else you need that is not included in the default config you can add in an `[extra]` section at the end of the config file (but careful with [TOML's weird nature](https://hitchdev.com/strictyaml/why-not/toml/).
(While writing this I had the same feeling when looking at Zola docs for [generating a Table of Contents](https://www.getzola.org/documentation/content/table-of-contents/), vs the external [plugin for 11ty](https://github.com/uncenter/eleventy-plugin-toc)). I like Zola's opinionated nature, its directory structure and its use of section and pages to organize content, it's easy to understand and to use, and I don't have to think about it too much.

In any case, Zola was exactly what I was looking for, and made the switch process easy. Plus I don't need to worry about plugins breaking, node or JavaScript environments, or heavy maintenance. There are only a couple of issues that this ssg currently has:
- there are fewer people using it. This means very, very little amount of helpful blog post. Although, again the docs are mostly useful enough. But in the end, your main source of information on how other people are implementing stuff is to look through the [Zola Themes Gallery](https://www.getzola.org/themes/).
- There is only one person working on it. This is mostly a worry than a real issue, Keats (Vincent Prouillet, the creator of Zola) is very active, [Zola forums](https://zola.discourse.group/) ([THANK YOU FOR THAT](https://kotaku.com/please-stop-closing-forums-and-moving-people-to-discord-1847684851)) are alive and well, and the slow pace of releases is not necessarily a bad thing. Nonetheless, I kind of understand the worried questions by [Abhishek Sundararajan](https://www.asun9.com/migrating-to-zola/#what-i-don-t-like-about-zola). Note however that Keats have been highly active in the development of a [Tera v2](https://github.com/Keats/tera2) (which will then be brought into Zola), which is likely why there is less action in the Zola repo. Plus PR contribution and talks still happened from what I can see, so I hope we will get a new release soon, especially to see [better footnotes implemented](https://github.com/getzola/zola/pull/2326).

I would love that Zola docs would add some more real-world example. Apparently this is an issue with most ssg documentations tough. Eleventy docs are not good ([I'm not the only one saying this](https://web.archive.org/web/20230531002740if_/https://uncenter.org/posts/thoughts-on-eleventy/)), but the amount of techy people using it means you have a load of blog posts to help you, something that Zola doesn't really have (I stand corrected here as while writing I found this - albeit old - [youtube playlist](https://www.youtube.com/watch?v=rLcziFHhpPI&t=279)).
The search feature is an example of this. I don't want a search bar popping from the site header as apparently all Zola templates do. I was able to do an inline search on a dedicated page with Eleventy (again, thanks to other people's blogs), but not in Zola. Of course this is mostly my lack of knowledge regarding JavaScript, but in any case it's an additional feature, and not one I necessarily need. 

## The changes

I used the Academic theme for Hugo as a base. As highlighted in the [credits](https://www.andreatitolo.com/credits), most of the heavy lifting was already done by the [Kodama Theme for Zola](https://www.getzola.org/themes/kodama-theme/). I looked a lot through its source code to understand Zola better and how to reproduce things from Hugo. The homepage is where most of the code is non-original (i.e. a combination of academic and kodama), while the other pages are almost completely handmade (me proud), and when not, the appropriate [credits](https://www.andreatitolo.com/credits) are given. It also helped me that I had a somewhat clear idea of what I wanted: a minimal and clean site with no JavaScript, inspired by Academic but with some personal modifications, single page, and modern feel.

### Semantic HTML

If you look at academic's code (at least the old version I was using) most of the page division and elements were divided using `<div>`. There were a lot, everywhere. Now, [divs have many issues](https://dev.to/kenbellows/stop-using-so-many-divs-an-intro-to-semantic-html-3i9i), and HTML5 introduced a standardized set of sematic elements that improved the possibilities of using [Semantic HTML](https://en.wikipedia.org/wiki/Semantic_HTML?lang=en). A semantic webpage has many advantages like readability, enhanced meaning and improved accessibility, thus there was no real reason to keep all those divs.

That said, I tried my best to put everything in a more semantic way (that would make sense, of course), and I think the results are quite good, especially for single publication/talks pages and lists. 
The homepage tough is another story, I haven't found a lot of ways to improve it, except for fixing some missing heading sequences and streamlining the structure of the page (it is also true that if something doesn't make sense semantically, divs are still a valid option). Let's see if I can come up with something in the future! (maybe sections? Although they would require a dedicated CSS class)

### SVG icons

Academic used font-icons for icon rendering, which added a lot of weight to the webpage and made extra network requests. I replaced those with inline SVG icons. SVG where optimized using [svgo](https://github.com/svg/svgo) to strip them of unnecessary code and make them more performant. My svgo config is like this, shamelessly copied from [Hasmin Aziz answer on stackoverflow](https://stackoverflow.com/questions/77259756/how-can-i-safely-minify-and-optimise-svg-files/77259757#77259757).

<details>
  <summary>SVGO config</summary>

  ```javascript
  // based on https://stackoverflow.com/questions/77259756/how-can-i-safely-minify-and-optimise-svg-files/77259757#77259757
  module.exports = {
    multipass: true,
    plugins: [
      {
        // Include and override the built-in plugins
        name: "preset-default",
        params: {
          overrides: {
            removeViewBox: false,
            // prevent breaking scaling for SVGs that are scaled with HTML, CSS or JS
            // see: https://github.com/svg/svgo/issues/1128
            removeTitle: false,
            removeDesc: false,
            // not necessary for safety, but better for accessibility
          },
        },
      },
      {
        // Better for accessibility
        name: "removeUnknownsAndDefaults",
        params: {
          keepRoleAttr: true,
        },
      },
  
      "prefixIds",
      // prevents conflicts with inline SVGs on the same page by prefixing with the name of the file
      // see: https://github.com/svg/svgo/issues/674
    ],
  };
  
  ```

</details>

I read a lot about SVG and what would be the best way to insert them in a website and I decided to go with inline SVG instead of sprites or external file. In the end I don't have too many icons and I haven't seen any performance hit (the implemented pagination should also help). 

One thing I am particularly proud of is that icons are forge-awared!
This is of course a hack, thanks to Tera I can check if the URL of the link to which the icon is assigned contains a specific pattern, and assign the correct icon for that:

```j2
{% raw %}{% for link in page.extra.links %}
{% if link.url is containing("github.com")%}
  {% set icon_name = "github" %}
{% elif link.url is containing("codeberg.org")%}
  {% set icon_name = "codeberg" %}
{% elif link.url is containing("forgejo")%}
  {% set icon_name = "forgejo" %}
{% else %}
  {% set icon_name = link.icon %}
{% endif %}
{% endraw %}
```
The icon is then called with its name using a Tera macro (thanks to the [Papermod theme](https://cydave.github.io/zola-theme-papermod/) for it):

```html
{% raw %}<li><a href="{{ page.permalink ~ link.url }}">{{icons::render_icon(icon=icon_name)}}{{ name }}</a></li>
{% endraw %}
```

### Single Page layout

I know this could be achieved in the original academic as well, but I realized I am hating doomscrolling and endless homepages more and more and I made myself a promise I would do a single-page homepage for this. I find it also simplifies navigation a lot.

### Minimalism

While I would not say the original academic "forced" you into overdoing with style and things, it definitely felt that a lot was going on. I opted for a more minimal and clean style, spacing and such, and I like the result. [Classless](https://classless.de/) and [SimpleCSS](https://simplecss.org/) were highly influential in the design-making.

### No JavaScript

I don't really need JavaScript on a static site, especially on an academic site. I know other people will, and that's okay, but I cannot find a use for it except for the internal search. As mentioned before, I failed at building a search page that satisfied me, so I decided to remove the search index all together. The entire website is visible with JavaScript turned off, which was not really the case with the original one.

**Note**: JavaScript is needed when viewing interactive HTML slides, not much I can do about it (and quarto conversion from HTML to PDF isn't yet good enough). 

### New forge

While the code of the original website was on GitHub ([and still is](https://github.com/andreatitolo/andreatitolo_web)), I am recently moving more and more away from GitHub as much, for [many](https://sfconservancy.org/blog/2022/jun/30/give-up-github-launch/) [reasons](https://nogithub.codeberg.page). I am also trying out selfhosting (yay!), I have a Hetzner VPS with [Yunohost](https://yunohost.org/#/), and I wanted to have my own git forge. So you can find the code of the website on [Forgejo](https://codeberg.org/titoloandrea/academic_website_zola). Changing this in Netlify was a breeze thanks to the instruction [provided on their docs](https://docs.netlify.com/git/repo-permissions-linking/#change-linked-git-repository). A caveat to this is explained [later on](#deploying-to-netlify-with-a-self-hosted-forge).

**Update 2024-06-21**: I ended up deprecating my self-hosted instance (mainly for cutting costs), so the code of the website is now on [Codeberg](https://codeberg.org/titoloandrea/academic_website_zola). 

### Robots.txt

The original robots.txt was simply a "free-for-all" rule. I changed this to avoid common ads crawlers, unhealthy social networks, and AI GPT stuff (this is also extended with a dedicated `<meta name="robots" content="noai, noimageai">` tag in the site header). Note that the list below will [probably be extended](https://darkvisitors.com/).

```txt
User-Agent: ChatGPT-User
User-Agent: GPTBot
User-Agent: anthropic-ai
User-agent: Google-Extended
User-agent: CCBot
User-Agent: FacebookExternalHit
User-Agent: Twitterbot
User-Agent: LinkedInBot
User-Agent: AdsBot-Google
User-Agent: Mediapartners-Google
User-Agent: AdsBot-Google-Mobile
User-Agent: adidxbot
Disallow: /

Sitemap: https://andreatitolo.com/sitemap.xml

```

## Results and Performances

Overall I am happy with the results, although at first look the website did not change too much, there has been a lot of improvements underneath.

Just to give some bullet points about meaningful changes:

- The entire website (uncompressed) went from **1.94 MB** (with 48 network requests!) to roughly **103.68 kb** (and 5 network requests). I have no idea how much percentage decrease is that, but it's a lot. What does that mean? Basically the page will load faster, less bandwidth will be used, and less carbon produced in return. This is thanks to the removal of webfonts, maps, CDN, and many more things.
- The website is more eco-friendly: from producing 0.24g of CO2 (Carbon Rating B) every time someone visited the homepage, it now produces 0.1g only (Carbon Rating A+). Ecograder score also jumped from 77 to 93. It can still be improved, and I think the fault might lie on SVG and the image in the homepage, but I am not really sure, I need to read more about it.
- Fixed a lot [HTML](https://validator.w3.org/nu/?doc=https://animated-sherbet-085d6f.netlify.app) and [CSS](https://jigsaw.w3.org/css-validator/validator?uri=https%3A%2F%2Fanimated-sherbet-085d6f.netlify.app&profile=css3svg&usermedium=all&warning=1&vextwarning=&lang=it) errors, and both are now validated.
- The lighthouse report also shows a large improvement regarding accessibility and performances, especially on mobile.
- Build time on Netlify also decreased by around 10-15 seconds.

{{ image(src="lighthouse_mobile_old.webp" alt="lighthouse mobile report for the old website", class = "img-centered", caption = "Old lighthouse report", loading = "") }}

{{ image(src="lighthouse_mobile_new.webp" alt="lighthouse mobile report for the new websit", class = "img-centered", caption = "New lighthouse report", loading = "") }}

## Practicalities and Issues

I didn't have any real issues, I kind of wanted to put the only JavaScript scripts in a search functionality, but I didn't like the way other themes implemented it and the docs are a bit lacking in that regard, so I failed (for now). In any case, I implemented a search box using DuckDuckGo, which should supply as a valid alternative.

Coming from Hugo, the only real thing to change when moving content was converting the frontmatter from YAML to TOML and be careful with quotes or indentations. I used an [online converter](https://transform.tools/yaml-to-toml) because I didn't have too many things, but I know there are [local tools](https://github.com/booniepepper/yaml2toml) as well. Other things were like moving things around in the frontmatter and in the `extra` section.

Tags and Authors are treated as taxonomies, and they got their respective page now (much better than it was before).

Atom feed is now available both for the whole thing but also for just either publications, talks, and teaching. Zola makes it super easy to create a feed for a section (a group of elements like blog posts), as it is just a matter of putting `generate_feed = true` in the frontmatter of the `_index.md` of the section root.

### Strict Content Security Policy and Quarto RevealJS slides

As part of the rewrite I implemented a [Content Security Policy](https://en.wikipedia.org/wiki/Content_Security_Policy), which was missing completely. CSP is an added layer of security against data theft, malwares, etc. (read more on [MDN Docs](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)). 

The CSP implemented on the website is similar to the one I use here, which is in turn based on [Simone Silvestroni example](https://minutestomidnight.co.uk/blog/content-security-policy/).

However, I could not implement a strict CSP because of the RevealJS slides I host on the website. Unfortunately these slides (produced with [Quarto](https://quarto.org)) require `unsafe-inline` and `unsafe-eval` to be present in the CSP. This basically defeats the purpose of the `script-src` declaration, but I found no other way. Of course one solution would be to turn those HTML slides in PDF, but I think interactive slides are better, plus Quarto conversion to PDF from HTML is still not consistent or good enough, and I always had errors (I might do it tough). Plus I had some slides I used and linked as part of a course, and I didn't want to break those links. That said, being the website a static site, security can be less of worry, sometimes. 

### Redirects and broken links

We all know [cool URIs don't change](https://www.w3.org/Provider/Style/URI), and I tried my best to avoid site breakage. Academic directory structure was inconsistent and weird (`events` for talks homepage, but each talk was under `talk/slug`). I changed that, and the name for the publications' homepage. Since slides where located in a `slides` folder, I kept that only for the HTML slides that were already present in the old website. New slides will be [colocated](https://www.getzola.org/documentation/content/overview/#asset-colocation) in the same folder as their respective page.

I used [Netlify redirects](https://docs.netlify.com/routing/redirects/) (server-side) declared in the netlify.toml file. This option should be more performant and if in the future I'll switch _ssg_ again I should probably not worry about that at least. 
I used [Zola aliases](https://www.getzola.org/documentation/content/page/) for URLs that changed completely. To apply the filename format I prefer I put an `aliases` option in each page frontmatter for Talks. This results in a correct redirect to the new `date-event` format, instead of the old  `file slug` path (which usually resulted in huge URLs).

I made other changes that can be inspected in the [netlify.toml](https://codeberg.org/titoloandrea/academic_website_zola/src/branch/main/netlify.toml) file. I am checking for broken links and will keep an updated list of (hopefully none/few) broken links and reference that in the 404 page.

### Deploying to Netlify with a Self-hosted Forge

Netlify doesn't yet allow using a selfhosted Forgejo/Gitea as linked repository for website linking. There is [a way of making this happen](https://davejansen.com/publish-to-netlify-using-gitea-actions/) using the recent Forgejo actions, but it requires to have a runner set-up, which in turn seems to require knowledge of Docker, and I have yet to acquire that. I want to try and see if I can use [Woodpecker CI](https://woodpecker-ci.org/) to do something similar, but I am not really sure that would work either.

In any case, for now I set up a [push mirror](https://docs.gitea.com/usage/repo-mirror#pushing-to-a-remote-repository) that goes through a [GitHub repository](https://github.com/andreatitolo/academic_website_zola) which Netlify uses as build source. I would love to completely move away from GitHub, but I can at least not "actively" using it for the website (and all links to the source code points to the Forgejo repo).

## Further reading

These are just some links that I found around regarding Zola and people building their site with it. Again, I personally found that the best solution is to follow the [zola introduction](https://www.getzola.org/documentation/getting-started/overview/#first-steps-with-zola) and then just look at how up-to-date [themes](https://www.getzola.org/themes/) do things.

- [https://daudix.codeberg.page/blog/website-rewrite-in-zola/](https://daudix.codeberg.page/blog/website-rewrite-in-zola/)
- [https://thedataquarry.com/posts/static-site-zola/](https://thedataquarry.com/posts/static-site-zola/)
- [https://www.kytta.dev/blog/one-week-with-zola/](https://www.kytta.dev/blog/one-week-with-zola/)
- [https://mrkaran.dev/posts/migrating-to-zola/](https://mrkaran.dev/posts/migrating-to-zola/)
- [https://prefetch.eu/blog/2022/website-adventures-generators/](https://prefetch.eu/blog/2022/website-adventures-generators/)
- [https://blog.paavo.me/how-i-built-this-site/](https://blog.paavo.me/how-i-built-this-site/)
- [https://www.rockyourcode.com/create-a-blazingly-fast-static-site-with-zola/](https://www.rockyourcode.com/create-a-blazingly-fast-static-site-with-zola/)
- [https://tqdev.com/2023-zola-ssg-is-4x-faster-than-hugo](https://tqdev.com/2023-zola-ssg-is-4x-faster-than-hugo)