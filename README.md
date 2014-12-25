blog.crowdint.com
=================

[![Build Status](https://travis-ci.org/crowdint/blog.crowdint.com.svg?branch=master)](https://travis-ci.org/crowdint/blog.crowdint.com)
[![Code Climate](https://codeclimate.com/github/crowdint/blog.crowdint.com/badges/gpa.svg)](https://codeclimate.com/github/crowdint/blog.crowdint.com)
[![Test Coverage](https://codeclimate.com/github/crowdint/blog.crowdint.com/badges/coverage.svg)](https://codeclimate.com/github/crowdint/blog.crowdint.com)

## Welcome to our, kind of new, blog.

It was time. A rewrite for this site was due since last year. So, I decided to
do something about it this weekend.

We were using [Jekyll](https://github.com/mojombo/jekyll) on our old version,
and it was great! until it became too slow to compile once we reached around 60
posts and it was a bit frustrating, discouraging us from blogging.

### Open Sourced

As we did with the old version, the code for this blog is open sourced.
You will find it on [its github page](https://github.com/crowdint/crowdblog).

### Rails 3.2.1

I know, even that there is probably a thousand blog services / gems / templates
out there to set up a blog immediately, but, there was a couple of things I
wanted to learn so, I decided to code it myself.

![image1](http://github.com/crowdint/crowdblog-app/raw/master/doc/images/image1.png)

### Really? Another Rails blog example

Well, yes. I know this is the example by choice when someone is trying to
learn Rails, but I still wanted to open source it for the following reasons.

Maybe someone needs to take a look at how I implemented the post CRUD using
[Backbone](http://documentcloud.github.com/backbone/).

Or take a look at how I used [Devise](https://github.com/plataformatec/devise) with
Google Apps login so only people with a @crowdint.com email account can access
the backend.

Another interesting bit is how I was able to preprocess JST templates through
[slim](http://slim-lang.com/) and [eco](https://github.com/sstephenson/eco).
**WARNING: THIS MIGHT NOT BE A GOOD PRACTICE**.

I am, by no means, an expert of what I just described. So, it is important for me
that someone else takes a look at the code and let me know how to improve it.

Example, I know there's not enough tests in the code. I suck because I couldn't
do follow the [TATFT](http://smartic.us/tag/tatft/) philosophy that I follow
on "real life" applications.
I lie to myself and think that it was because I really didn't know
what I was doing, but, its still a lie. Promise to make up for that soon.

![image2](http://github.com/crowdint/crowdblog-app/raw/master/doc/images/image2.png)

You won't see any Javascript tests because I don't have that much experience with
those, but, I am sure that soon, one of my [awesome teammates](https://github.com/crowdint)
will write and commit those. That way, I'll be able to learn about it.

There's obviously still a lot to do, I would like to see a better post editor. I love Markdown, I want to try and find
a JS WYSIWYG plugin that supports it. I would also love to move the backend to a Rails Engine
so its more reusable. I'll work on all these items as time permits.

So, there you go. Yet another _Backbone_, _Twitter Bootstrap_, _Devise_, _Slim_, _Rails 3.2_ sample
application.

Hope browsing through this code helps you learn something.
Hope browsing through this code encourages to teach me something.

Issues and Pull requests are more than welcome.

---

