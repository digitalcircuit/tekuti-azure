## Synopsis

Tekuti-azure is a Scheme-based, git-backed personal blog. It is based
on Andy Wingo's original [tekuti](https://wingolog.org/projects/tekuti/).

## Motivation

I have wanted a personal blog for a while. I have also wanted to make
better use of Syndication to present comments hierarchically and to
allow people to respond to posts without using a web browser using
AtomPub. I also want to program in a language I enjoy.

This is a *fork* in the classic Free software sence, not in the github
sense. I'm perfectly happy to give back any changes I make to the
community, but as some of my plans involve removing or heavily
changing features, I expect they won't want all of them.

## Installation

Edit `config.mk` to your satisfaction. It should work as is on a
vanilla Linux system with Guile installed under `/usr`. Then type
`make`. You can `make install` if you want, or run it out of the build
directory.
