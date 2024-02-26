<?xml version="1.0" encoding="utf-8"?>
<!--

# Pretty Atom Feed

Based on "Pretty RSS Feed": https://github.com/genmon/aboutfeeds/issues/26

Styles an Atom feed, making it friendly for humans viewers, and adds a link
to aboutfeeds.com for new user onboarding. See it in action:

https://nicolas-hoizey.com/feeds/all.xml

-->
<xsl:stylesheet
    version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="atom:feed/atom:title"/></title>
        <link rel="stylesheet" href="/css/rss.css"/>
      </head>
      <body>
        <nav class="container">
          <p class="about">
            <strong>This is a web feed,</strong> also known as an RSS or Atom feed.
            <p><strong>Subscribe</strong> by copying the URL from the address bar into your newsreader.</p>
          </p>
          <p class="gray">
            If you need more information about RSS feed, you can check <a href="https://alirezahayati.com/2021/09/11/what-is-rss-really-simple-syndication/">this blog post</a> or <a href="https://www.thisdaysportion.com/about/what-is-rss/">this guide</a>. To choose an app to use as a feed reader, you can look at the <a href="https://indieweb.org/feed_reader">IndieWeb Camp website</a> or the same guide linked above.
          </p>
        </nav>
        <main class="container">
          <header>
            <h1>
              Web Feed Preview
            </h1>
            <h2><xsl:value-of select="atom:feed/atom:title"/></h2>
            <p><xsl:value-of select="atom:feed/atom:description"/></p>
            <p>This preview only shows titles, but the actual feed contains the full content.</p>
            <a>
              <!-- <xsl:attribute name="href">
                <xsl:value-of select="/atom:feed/atom:link[not(@rel)]/@href"/>
              </xsl:attribute> -->
              <a href="/">Return to the Homepage &#x2192;</a>
            </a>
          </header>
          <h2>Recent Items</h2>
          <ul>
            <xsl:apply-templates select="atom:feed/atom:entry" />
          </ul>
        </main>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="atom:feed/atom:entry">
    <li class="item">
      <h3>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="atom:link/@href"/>
          </xsl:attribute>
          <xsl:value-of select="atom:title"/>
        </a>
        <p>
          <small>
            <xsl:value-of select="atom:summary"/>
          </small>
        </p>
      </h3>
      <small class="gray">
        Published: <xsl:value-of select="atom:updated" />
      </small>
    </li>
  </xsl:template>
</xsl:stylesheet>