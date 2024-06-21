+++
title = "The big SSG switch (and other things)"
date = "2024-04-02"
draft = false
updated = "2024-06-21"
[taxonomies]
tags = ["blog", "zola"]
+++

<small>Apologies in advance for filling the feed with old posts, it was a side effect of changing feeds!</small>

I [already spoke](/blog/rebuilding-my-academic-website-with-zola#zola) about how I was sold on Zola as my SSG of choice. For the past month or so I have been switching SSG from Eleventy. It's been a slow process not much because of the difficulties, but mostly because I had very little time to dedicate to this website recently.
I won't list here the reasons for the change, because I already highlighted them in the post linked above. I will just briefly speak about the switch and all the new things that I have added to the website in the meantime.

In general, switching from 11ty to Zola was quite easy: apart from changing all YAML frontmatters to TOML, other things that needed an adjustment were stuff implemented by 11ty through plugins, e.g. image optimization, rss feed, styling markdown anchors etc. Most of these things are offered by Zola out-of-the-box, while for the image optimization I took [this shortcode](https://gitlab.com/crepererum/blog/-/blob/master/templates/shortcodes/image.html?ref_type=heads) and adapted a little bit for my need. Other things are implemented through Zola templates, for example [anchor link](https://codeberg.org/titoloandrea/personal_blog_zola/src/branch/main/templates/anchor-link.html), [atom feed](https://codeberg.org/titoloandrea/personal_blog_zola/src/branch/main/templates/atom.xml), [table of contents](https://codeberg.org/titoloandrea/personal_blog_zola/src/branch/main/templates/partials/toc.html). There were other changes under the hood, but quite some time has passed and I forgot.

I have been reading a lot of other people blogs, about the small web, the indieweb, and so on. I really liked what I saw, and decided to implement some of these things and rework others.

A TLDR of the changes:

## New stuff

- New section in the [homepage](/), with proper webrings formatting and links
- [Bookmarks page](/bookmarks)
- [Ideas page](/ideas)
- [Buttons!](/about#buttons)
- [Security.txt](/.well-known/security.txt) and [gpg key](/files/pubkey.txt)
- [Humans.txt](/humans.txt)
- [Feed page](/rss) and different feeds per topic, plus new style for the feed page
- Added a warning for content older than 365 days (inspired by [Bacardi55](https://bacardi55.io/2024/02/12/adding-an-alert-on-old-posts-with-hugo/) and this [Zola forum post](https://zola.discourse.group/t/is-it-possible-to-compare-a-posts-date-to-now/1229/2))

## Other changes

- Enlarged central column in the css grid
- Reworked the [about page](/about)
- Reworked the [blog list](/blog) style (also in the homepage) to extend horizontally instead of vertically as it was before
- Added description for pages like blog and bookmarks.
- [Blogroll](/links) is now formatted in a nicer way, description etc.
- Updated the [credits](/credits) to reflect Zola experience
- Refreshed [tags](/tags) and tag pages, inspired by [Even theme](https://getzola.github.io/even) and [Zola Papermod](https://cydave.github.io/zola-theme-papermod/) themes
- Updated [robots.txt](/robots.txt) to block all the AI scrapers (thanks to [https://darkvisitors.com](https://darkvisitors.com))
- Implemented catppuccin syntax higlight as [custom syntax highlight theme](https://www.getzola.org/documentation/content/syntax-highlighting/#custom-highlighting-themes) (thanks to [bat's catppuccin themes](https://github.com/catppuccin/bat/tree/main/themes))
- A new [image shortcode](https://codeberg.org/titoloandrea/personal_blog_zola/src/branch/main/templates/shortcodes/image.html) to replace the 11ty image plugin, adapted by the one made by [Marco Neumann](https://gitlab.com/crepererum/blog/-/blob/master/templates/shortcodes/image.html?ref_type=heads).
- No more rss feed (only atom feed), but different types of feeds in the [feed page](/rss)
- Source code is now on a self-hosted Forgejo instance, and only mirrored on Github for Netlify automated builds (**Update 2024-06-21**: I deprecated my self-hosted instance, and the code is now on [Codeberg](https://codeberg.org/titoloandrea/personal_blog_zola))

## Description and (few) screenshots

The thing I like about these changes is that the blog feels more alive and "in line" with the indieweb community. I am particularly happy with the changes in the [about page](/about). I tried to make it less wordy and in general to reduce the amount of work-focused content on that page, which is now only a small paragraph and not at the beginning, because [work does not define me](https://minutestomidnight.co.uk/blog/merge-personal-with-work/) and this place is not for a personal brand or a [side hustle](https://starbreaker.org/blog/rants/not-my-side-hustle/index.html), I don't need to sell myself or sell anything else at all. I have an academic website linked in the page, where I host my work-related stuff, and I don't really need it here.

{{ image(src="about-old.webp" alt="Old about page", class = "img-centered img-border", width_override = 400, caption = "Old about page layout", loading = "lazy") }}

{{ image(src="about-new.webp" alt="New about page", class = "img-centered img-border", width_override = 400, caption = "New about page layout", loading = "lazy") }}

Another things I really came to love are 88x31 buttons, I was considering to put them in the homepage, but I did not want to bloat it too much. Instead, I just put a link to it. I also created [my own buttons](/about#buttons)! feel free to use it and link it to this website (please don't hotlink).

The blogroll rework is also something I really enjoyed. The table layout was inspired by a past iteration of [Starbreaker](https://starbreaker.org) website. Now instead of just a bullet points there is an organized list of links in a table format, with rss feed links and a short description. The table is built from a [TOML array](https://codeberg.org/titoloandrea/personal_blog_zola/raw/branch/main/content/links.md) with the help of a [template](https://codeberg.org/titoloandrea/personal_blog_zola/src/branch/main/templates/blogroll.html). Probably not the more optimal solution (and definitely not the most readable) but I wanted to see if it could be done.

{{ image(src="blogroll-old.webp" alt="Old blogroll style", class = "img-centered img-border", width_override = 300, caption = "Old blogroll style", loading = "lazy") }}

{{ image(src="blogroll-new.webp" alt="New blogroll style", class = "img-centered img-border", width_override = 400, caption = "New blogroll style", loading = "lazy") }}

The [ideas](/ideas) page was inspired by [Bacardi55](https://bacardi55.io), I usually just have TODO.txt file in the root folder of my VSCodium project, but this is a nice addition to have and a reminder for myself as well.

The new bloglist feels also much cleaner in my opinion and less condensed. I was a bit conflicted on the layout, if having something spaced on the two sides like [Simone Silvestroni](https://minutestomidnight.co.uk/blog/) or not. But in the end I went for a more standard approach and it feel fine tbh.

Blogs will also display a warning if the content is older than 365 days. I am considering doing something similar for long content (it would actually made more sense).

{{ image(src="old-content.webp" alt="Old content warning", class = "img-centered", width_override = 500, caption = "Warning for content older than 1 year", loading = "lazy") }}

Some restiling have been done also to the [homepage](/), with the addition of a proper section for the webrings and link to the blogroll and the button wall, and the new bloglist style.

[Tag list](/tags) and [tag pages](/tags/blog/) have also been reworked. I am not completely sold on the new tag list page, I think having links styled as buttons is not really a good practice and might be confusing. I will probably change this in the future.

Lastly, the blog now offers three different feeds: a [general feed](/atom.xml), comprising both blog posts and bookmarks, a feed [only for blog posts](/blog/atom.xml), and one [only for bookmarks](/bookmarks/atom.xml). If someone was subscribed to the feed before, he will be subscribed to general one. I also took inspiration from [Vivaldi](https://vivaldi.com/) feed viewer for generating a human-readable feed page (inspired by [Derek Kay](https://darekkay.com/blog/rss-styling/) and many others).

It was a nice thing to do, and I learned a lot thanks to the examples of many talented people. I am already considering more changes (color scheme, css framework inspiration, I discovered [Tiniri](https://tiniri.vlad.studio/) and [SuCSS](https://speyll.github.io/suCSS/) recently), but that's for another time.