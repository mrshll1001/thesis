---
layout: page
title: API Standard
permalink: /api-standard/
---
Qualitative Accounting is designed to be flexible and to prevent users from becoming tied to particular services. As such there are many potential use-cases for applications, such as:

* Running locally on independant devices (e.g. smartphone apps, desktop software)
* A web service or data portal
* A service or application with multiple components designed to work together (Software with a web api etc)

The [data standard](/producing-data) allows a URI to be sent for any media items affiliated with an item. Some software running on local devices may not be affiliated with a web service and as such cannot provide a public-facing URI for locally stored media. A common format for these URIs is required in order to facilitate storage and exchange between services.

## Building a media item URI.
A media item URL should be based off of the service that is storing the media, and the file that is being stored. It follows the following template:
```
http[s]://[www.website-url.dom]/qualitative-accounts-data/[sha-1FileHash]
```
The SHA-1 hash of the file gives a unique identifier for files, and can be generated both on server-side applications (such as the web) and client applications such as mobile apps or desktop software. This allows a separation of concerns for applications when sharing data vs uploading media: effectively allowing a small app to share an item with a service without needing to transfer the file at the same time.

## Uploading media
