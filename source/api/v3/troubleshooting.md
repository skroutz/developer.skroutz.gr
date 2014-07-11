---
title: troubleshooting | skroutz api
---

# troubleshooting

* toc
{:toc}

if you're encountering some oddities in the api, here's a list of resolutions to
some of the problems you may be experiencing.

## why am i not seeing all my results?

most api calls accessing a list of resources (_e.g._, categories, skus, _e.t.c._) support 
pagination. If you're making requests and receiving an incomplete set of results, you're 
probably only seeing the first page. You'll need to request the remaining pages 
in order to get more results.

It's important to *not* try and guess the format of the pagination URL.  
[More about pagination](/v3/#pagination)
