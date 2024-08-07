+++
title = "RSS Feed"
updated = "2024-03-11"
+++

You can follow this blog using RSS. If you don't know what RSS is, take a look at [this blog post](https://alirezahayati.com/2021/09/11/what-is-rss-really-simple-syndication/) or [this guide](https://www.thisdaysportion.com/about/what-is-rss/). You can use any feed reader you want, if you don't know where to start you can look at the [IndieWeb Camp website](https://indieweb.org/feed_reader) for guidance. Please avoid using and supporting Feedly and its [bloatware design](https://erikgahner.dk/2022/goodbye-feedly/) and [anti-workers](https://web.archive.org/web/20230329162149/https://blog.feedly.com/how-to-track-protests-in-your-market-with-feedly-ai/) [behaviour](https://newsletter.mollywhite.net/p/feedly-launches-strikebreaking-as).

There are three different feeds available on this blog (all of them are also exposed in the site `<head>` for auto-discoverability), and since [Zola 0.19](https://github.com/getzola/zola/releases/tag/v0.19.0), both atom and rss feeds are available:
- Feed for everything (blog, bookmarks) ([atom](/atom.xml) | [RSS](/rss.xml)).
- Feed for blog posts only ([atom](/blog/atom.xml) | [RSS](/blog/rss.xml)).
- Feed for bookmarks only ([atom](/bookmarks/atom.xml) | [RSS](/bookmarks/rss.xml)).

Atom feeds follow the [Atom standard](https://en.wikipedia.org/wiki/Atom_(web_standard)?lang=en&lang=simple), so you'll get the whole content of each post without needing to make additional requests or to open the website, while RSS feeds follow the [RSS 2.0 Specification](https://www.rssboard.org/rss-specification#ltauthorgtSubelementOfLtitemgt).

If you prefer to have the whole post content in your feed reader, I suggest subscribing to the atom ones.