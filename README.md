Robut
======

Robut is a Ruby framework for Reddit bots.

![CircleCI Status](https://circleci.com/gh/EddM/robut.svg?style=shield&circle-token=ccbe1e900b4feda8a42aab885bd49e513fe3a67b)

## Installation

    gem install robut

## Quick Start

````ruby
require "robut"

robut "My_Bot", "p4ssw0rd" do
  listen /kittens/i do |comment|
    reply_to_comment comment, "Kittens are awesome!"
  end
end
````

## Contributors

If you wish to contribute to robut, please go right ahead. It's not in a very stable position right now, so any pull requests are welcome as long as they're accompanied by tests. Maybe you'd like to tackle one of the below...

### Roadmap

On top of bug fixes and documentation, here is an idea of some features I'd like to get into robut. If you'd like to get involved with the project, perhaps one of these is a good place to start?

[ ] Integration with a pseudo-realtime reddit library (like what [Pusher](https://blog.pusher.com/pusher-realtime-reddit-api) are doing)
[ ] "Advanced usage" (perhaps the ability to provide custom classes instead of simple blocks to listeners)
[ ] Better rate-limiting support

## License

robut is distributed under the terms of the GPL license. See LICENSE for details.
