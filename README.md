# rdio-service

[![Build Status](https://travis-ci.org/darbyfrey/rdio-service.svg?branch=master)](https://travis-ci.org/darbyfrey/rdio-service)

1. [Overview](#overview)
2. [How Does It Work](#how-does-it-work)
3. [Endpoints](#endpoints)
4. [Playback Tokens](#playback-tokens)
5. [Extra Links](#extra-links)

### Overview

The `rdio-service` provides a simple interface into the Rdio API.

### How Does It Work

The service is hosted on Heroku at:

```
http://rdio-service.herokuapp.com/
```

The service exposes a few endpoints for finding music:

* `/search?q=[Artist, Song, or Track]` (accepts option params of `type` or `types[]` which will accept a single type or an array of the following values [Artist, Song, or Track])
* `/albums?artist_id=[Artist ID]`
* `/albums/:album_id`
* `/tracks?artist_id=[Artist ID]`
* `/tracks/:track_id`
* `/playlists/:playlist_id`

There is also an endpoint to generate a playback token. This is necessary if you want to actually stream music from Rdio:

* `/playback_tokens`


### Endpoints

```
GET        /albums?artist_id=...                    # Get a collection of albums for a given artist_id
GET        /albums/:album_id                        # Get an album for the given album_id
GET        /playlists/:playlist_id                  # Get a playlist for the given playlist_id
POST       /playback_tokens                         # Get a playback token
GET        /search?q=...                            # Get a collection of artists, albums, and tracks for the given q
GET        /tracks?artist_id=...                    # Get a collection of tracks for a given artist_id
GET        /tracks/:track_id                        # Get a track for the given track_id
```

### Playback Tokens

In order to be able to stream music from Rdio, you will need a playback token. A playback token can be obtained by sending a POST request to:

```
POST  /playback_tokens
```

It also accepts an optional `domain` parameter. `domain` defaults to `localhost` unless otherwise specificed. The `domain` will need to match the host of the site your app will play from.

Once you have a playback token, you can pass it to the Rdio jQuery library as described here:

[http://www.rdio.com/developers/docs/libraries/jquery/]()

### Extra Links

- [Rdio Web Service API](http://www.rdio.com/developers/docs/web-service/index/)
- [Rdio Web Playback API](http://www.rdio.com/developers/docs/web-playback/index/)
- [Rdio Web Playback jQuery Library](http://www.rdio.com/developers/docs/libraries/jquery/)