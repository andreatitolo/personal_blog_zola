+++
title = "Trying out Positron for R use"
description = "Positron seems nice"
date = "2024-09-16"
draft = false
[taxonomies]
tags = ["r", "rstudio", "positron"]
+++

Recently the people behind Rstudio/Posit have announced the release of Positron, a new IDE for R. I guess this new IDE address the will of Posit to move more away from the R-only world, as they already did with the company rebranding and with the release of Quarto.

Positron is basically Visual Studio Code but tailored for R and Python. I moved away from RStudio a while ago because I found it too sluggish, oldish and not as flexible as I wanted. I am using VSCodium so I am definitely non against using that as a base for something new. 

I did try Positron for a while and I am definitely liking it. There are still things missing (e.g. RStudio addins) but it kind of feels as a nice IDE without needing to setup all the R extensions for VSCode+Radian console. Everything is very fast, plots visualization is way better than both RStudio and VSCode (this is the most painful part of not using RStudio), and viewing data.frame/matrix is a great experience. 

{{ image(src="./positron_general_view.webp" alt="Positron IDE with code and plot visualization", class = "img-centered", caption = "Positron IDE - I was testing out the kairos package by N. Frerebeau ", loading = "lazy") }}

The `View()` function brings up a nice viewer with the df just as RStudio/VSCode, but with a new pane that provides a list of columns and some summary data about each column. I find the graph visualization a bit confusing (the percentage is the amount of missing data), but the whole idea is quite cool.

{{ image(src="positron_df_view.webp" alt="Positron IDE View with the new data frame viewer", class = "img-centered", caption = "The new dataframe viewer, again using the kairos package as example", loading = "lazy") }}

All in all, it seems like a nice tool, I would have preferred for them to use the AGPL license (open-source) just as with RStudio, instead of the Elastic license (source-available). But I am a dreamer.

A nice(r) presentation of Posiron with some actual useful tips and tricks was recently published by [Andrew Heiss](https://www.andrewheiss.com/blog/2024/07/08/fun-with-positron/), definitely worth a read! 

## Addendum

I have no real sympathy for Posit as a company, due to some past stuff about collaborating with Palantir, and the weird PR answers that followed. I believe a company that wants to be seen a good open-source citizen should hold up to better standards, especially when choosing partners (even if it doesn't impact users directly).

I also kind of disagree with many dev/user resources that silos people towards using the company's tools such as RStudio or the company's packages such as the Tidyverse. R is accessible to everyone regardless of the tools/libraries, and resources should reflect that.