+++
title = "My XKCD-1172"
date = "2024-04-09"
draft = false
description = "It was doomed to happen"
[taxonomies]
tags = ["quarto","bibtex", "zotero", "jabref", "XKCD"]
+++

Something funny happened to me a few days ago. Preamble: I use [quarto](https://quarto.org) for most of my academic writings, but through [VSCodium](https://vscodium.com/). Quarto allows to generate citations from a bibtex file or a Zotero database thanks to a `bibliography:` option in the YAML frontmatter (if someone use Zotero, that option will instead populate the file only with the cited element, which is cool).
Anyway, since I don't use Zotero but I use [JabRef](https://jabref.org) (more on this in another future post), I have a `.bib` file where all my collected literature lives (versioned), and that I use to cite across projects. This file is stored, of course, in a different folder than the projects itself. Until version 1.4.552/1.4.553, I was able to make quarto (pandoc, under the hood) generate my references using this syntax: 

```yml
bibliography: /absolute/path/to/ext/folder/refs.bib
```

Now the more programming-literate than me would see that this was never meant to function like I was using it, as the first `/` should underline a relative path from the project root, and not an absolute path on my machine.

It was a bug that somehow was there until version 1.4.553/54 (I started using quarto from version 1.2 I believe), and was fixed by one of the recent releases. Anyway, it just made me think about this xkcd comic: [https://xkcd.com/1172/](https://xkcd.com/1172/) (every change breaks someone's workflow).

It was supposed to happen, sooner or later. Thankfully I was offered some solutions by one of the quarto dev:

> Some possible workaround for your workflow, in increasing levels of hackiness:
>  - If you're on Unix, you can use a hard link
> - If you're inside a project, you can use a prerender script to copy the file to the right place (so that it's always up to date)
> - If you're in a single-file render, you can create a Lua filter that copies the file to the right place (again, so that it's always up to date)

For now the hard link solution isn't really working, I guess because of how JabRef saves the files? I don't know tbh and I don't have the technical skills for the other two. I'll admit that the idea of having to switch to Zotero again just for this is annoying me a little.