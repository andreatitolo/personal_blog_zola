+++
title = "TIL - Arranging rasters in QGIS 'Build Virtual Raster'"
description = "I was probably just dumb enough not to know this already"
date = "2024-06-21"
draft = false
[taxonomies]
tags = ["qgis", "remote sensing", "band combination"]
+++

Just a quick note this time. 
Since a few years by now I think, QGIS removed the option to manually edit the GDAL command directly from a processing window. This was especially bad for me because I relied a lot on the algorithm "Create Virtual Raster" to generate band combination of satellite images (I know there are other ways but this was the quickest for me). These bands do not necessarily need to be merged in a specific order for the algorithm to work, but it is handy if they are, because then you do not need to change the band order in the QGIS layer style window. 

Anyway, before one of the past updates, you could manually edit the GDAL command to reorder the bands, but for a while now that is impossible (at least with my lazy attempts), and it always bugged me. But apparently when you are selecting the raster to be combined with the ellipsis (`...`) button, you can drag and drop the raster, and they will be merged in that order!

Anyway, nice find, I didn't know that, and I don't think the documentation mention it (I might be wrong tough).

