# README

A learning project based on https://www.hotrails.dev/turbo-rails for Hotwire.

It uses devise for user auth. On sign up users can create posts. Depending on
the company they have created their account against, they will only see posts
belonging to that company.

There is are two post models `Post` and `TurboFramePost`. The latter is the main
one. I created two modeles for the one table just to lazily separate a non-turbo
frame approach (i.e. `Post`) from a SPA-like turbo frame approach (i.e.
`TurboFramePost`).

The views/frontend also subscribe to model changes via e.g.
`turbo_stream_from "super_posts"`.
