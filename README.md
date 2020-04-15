# Web App Size Reference

|name|url|size|
|----|----|----|
|Discord|https://discordapp.com/channels/@me|29.64 MB|
|Google Sheets|http://sheets.new/|14.59 MB|
|Facebook|https://www.facebook.com/|13.38 MB|
|YouTube|https://www.youtube.com/watch?v=T6neti7pIFo|7.92 MB|
|New York Times|https://www.nytimes.com/|7.19 MB|
|Google Doc|http://doc.new/|7.17 MB|
|Reddit Frontpage|https://www.reddit.com/|6.6 MB|
|Google Calendar|https://calendar.google.com/calendar/r|5.8 MB|
|Twitter Dashboard|https://twitter.com/home|4.08 MB|
|Google|https://www.google.com/|1.04 MB|
|GitHub Dashboard|https://www.github.com|678.95 KB|
|GitHub Signup|https://www.github.com|675.59 KB|
|GitHub PR Review|https://github.com/GoogleChrome/lighthouse/pull/10557/files|675.21 KB|
|Stack Overflow|https://stackoverflow.com/q/25176848|561.6 KB|
|Hackernews|https://news.ycombinator.com/|4.77 KB|
|example.com|https://www.example.com|0 B|

## Purpose

Do: use this reference as a loose guide for "do I really need X MB of JavaScript to deliver on Y features, if app Z does more with less?"

Don't: use this reference as carte blanche for providing more JavaScript. You're not making Facebook, so you probably don't needed >10MB of JavaScript.

## Methodology

* Sizes are the uncompressed resource length
* Collected by Lighthouse, data is from the 'resource-summary' audit
* All sites are desktop emulation. Where appropriate, a Chrome session with logged in state is used
* No user interaction (so lazy loaded scripts aren't counted)
