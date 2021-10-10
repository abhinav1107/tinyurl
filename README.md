# tinyurl
URL shortner

A friend asked me to write a simple URL shortner. At that time, I was in a very remote place, with no internet. Nothing else to do, this was my pass time.

Obviously not written for every use case in mind. And not planning to also. Made a github repo so that I can look at it from time to time. :D

Uses [Sinatra](http://sinatrarb.com/about.html), [Redis](https://redis.io/), [Docker](https://www.docker.com/) and [docker-compose](https://docs.docker.com/compose/).

clone this repo, and run
```
cd <repo-path>
docker-compose up --build
```

To create a New Shotent URL (assuming endpoint is http://localhost:4567):
```
curl -XPOST -d"<your full URL>" http://localhost:4567/
```

There are so many things that I can think of which is not handled correctly in this code:
- why store multiple values for same URL
- if point 1 is implemented, then how to handle same URL but different short key for different users.
- if point 1/2 is implemented, then how to optimise getting/searching this hash in redis.
- and others that I can't think of yet.

You get the point. Basically this is me saying: "Look, I made something cool. But I can't make it better. At least, for now." (at least, till I have to actually do it)
