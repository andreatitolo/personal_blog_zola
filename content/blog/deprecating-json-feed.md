+++
title = "Heads-up! deprecating json feed"
description = "Deprecating one of the two feeds"
date = "2024-03-07"
[taxonomies]
tags = [ "blog", "rss", "zola" ]
+++

In the wave of [rebuilding my academic website in Zola](../rebuilding-my-academic-website-with-zola/), I am doing the same for this blog. I will have a short dedicated post on that (I already speak too much about blog changes), this is just a short notice.

Zola unfortunately does not support ([and not planning to](https://zola.discourse.group/t/generate-both-rss-and-atom-feeds/441)) generating both rss and atom feed. So from now on, atom only!

I have no idea how many people (if any) are going to be affected by this (I don't track you), but if you are subscribed to [https://www.archaeoramblings.com/feed/feed.json](https://www.archaeoramblings.com/feed/feed.json), check if the feed is working for you in the next few weeks or so. I will make sure a redirect covers anyone already subscribed, but if something goes sideways, please let me know or switch to the atom feed available at the following link: 

[https://www.archaeoramblings.com/feed/feed.xml](https://www.archaeoramblings.com/feed/feed.xml)

[Atom is generally superior to rss/json](https://danielmiessler.com/p/atom-rss-why-we-should-just-call-them-feeds-instead-of-rss-feeds/), and it will give the reader the full article content, instead of just a section. Also, I will make sure that the [rss url will not change](https://kevquirk.com/dont-change-your-rss-url).