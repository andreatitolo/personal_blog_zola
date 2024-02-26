+++
title = "Use RSS! (For academic papers)"
description = "Just my two cents on using RSS for receiving newly published papers"
date = "2023-06-22"
updated = "2023-12-20"
draft = false
[taxonomies]
tags = [ "academia", "web", "RSS" ]
+++

_[2023-12-20 Update](#2023-12-20-update) - Added a way to subscribe to Springer Link rss feed_

As academics, one of our jobs (as with many other professions) is to keep up with current literature and discussions about methods, applications, and results in our field.

I don't know about others, but given the number of journals out there and our general workload, it is difficult to keep up with everything. Also, I don't like having my email clogged with thousands of newsletters. 

{{ image(src="rss.webp" alt="A woman shouting Use rss! with follow your sources at the bottom and top", class = "img-centered", caption = "Source image: Ali Reza Hayati - https://alirezahayati.com/feeds/") }}

# Enters RSS!

## What is RSS?

Put simply, RSS (or "really simple syndication") is a web feed (data format) that provides updates from websites to users through a standardized, open format. Basically, instead of checking each single website (blog or not) every time, a user can subscribe to the RSS feed of that website and get every update automatically through a news aggregator (e.g., a website or an app). It is an old web protocol since it was first released in 1999, but it's still alive and well. [This blog post about RSS](https://alirezahayati.com/2021/09/11/what-is-rss-really-simple-syndication/) takes a deeper dive into the topic, and I'll just leave it here for those interested.

## How do I use it for academic journals?

I don't see people talking about this enough, but many journals expose the RSS feed, either directly or indirectly. It is possible to either find a menu that says "RSS feed" or the [RSS icon](https://commons.wikimedia.org/wiki/File:Feed-icon.svg) somewhere.

Here is what it looks like on the homepage of Journal of Field Archaeology (Taylor & Francis)

{{ image(src="rss_tf.webp" alt="RSS feed menu for Taylor and Francis website", class = "img-centered", caption = "") }}

And here is the (slightly more hidden) RSS feed for the Journal of Archaeological Science (Elsevier):

{{ image(src="rss_elsevier.webp" alt="RSS feed menu for Elsevier", class = "img-centered", caption = "") }}


When you click on one of these links, you will either get a link with the instruction "Paste this into your RSS reader" or a page with some XML. In both cases, you just have to copy the link (in the case of the XML page, the URL in the address bar) into your RSS reader.

## Which rss reader?

As said before, RSS readers are apps or programs that aggregate updates from many websites in one place (e.g., a phone or computer). By using an RSS reader, we can get all the updates from potentially infinite sources right on the device of our choice.

There are tons of readers out there, and I have not definitely tried them all. I personally use [NetNewsWire](https://netnewswire.com/) on my Mac and iPhone, as I like [the choices behind it](https://inessential.com/2023/02/20/on_not_taking_money_for_netnewswire). On Windows, I used to appreciate [Fluent Reader](https://hyliu.me/fluent-reader/), but it's been a while since I used it. There are also web-based readers like [feedbin](https://feedbin.com/) (paid, in this case) which is the one I use coupled with NetNewsWire above. 


It's really up to anyone's preference. What's more, I don't have to settle on one app only, as subscriptions to RSS feeds can be exported and imported into another application easily. If an RSS reader doesn't allow you to export your subscriptions, avoid it like the plague. 
I also would refrain anyone from using the popular [feedly](https://feedly.com/) as reader of choice. I think readers should do one thing: keep it simple, give us access to the feeds, and not [evolve into a bloatware](https://erikgahner.dk/2022/goodbye-feedly/). Most importantly, a feed reader should not [instruct corporations on how to use its AI models for tracking and preventing protests and strikes](https://web.archive.org/web/20230329162149/https://blog.feedly.com/how-to-track-protests-in-your-market-with-feedly-ai/) ([another piece on this](https://newsletter.mollywhite.net/p/feedly-launches-strikebreaking-as)).

A note: Not all publishers expose the feed directly (which is a shame), but you can always try to copy the URL of the journal homepage in your RSS reader. In fact, in most cases, you don't need to hunt for the RSS link at all. Most readers are usually capable of identifying hidden feeds, if present. Springer-Nature is the one I have the most difficulty getting an RSS feed from, and I don't think they offer it at all (at least on the journals I tried).

### 2023-12-20 Update

Apparently, there is still a way of getting rss feeds from [Springer Link](https://link.springer.com): Springer provides rss feed for their [Springer Open portal](https://www.springeropen.com), where you can get a feed just by inserting the link of the journal homepage in your feed reader. However, Springer.com does not clearly expose a feed. Nonetheless, if you go to a Journal Page (and in the all Volumes and Issues list), e.g. the [Journal of Archaeological Methods and Theory](https://link.springer.com/journal/10816/volumes-and-issues) you can obtain a feed by clicking on the banner "Search all Journal of Archaeological Method and Theory articles ->". Clicking this link will bring you to a search page, copy the link from the address bar, which will be something like `https://link.springer.com/search?query=&search-within=Journal&facet-journal-id=10816`. Now you just need to add a `.rss` after `search` and before the `?`. The resulting feed link will be like this: `https://link.springer.com/search.rss?query=&search-within=Journal&facet-journal-id=10816` and you will be able to use it in your rss feed of choice.

## Enjoy!

I am pretty happy with the results I can get from subscribing to journals RSS feeds. Of course, if the paper is not open-access, you'll only see the title and maybe the abstract. Nonetheless, I can still get updates on my phone or laptop without going to different websites or subscribing to newsletter updates.

The only downside to this is that now my backlog of papers to read keeps increasing.