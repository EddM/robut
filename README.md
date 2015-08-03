Robut
======

Robut is a Ruby framework for Reddit bots.

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

If you wish to contribute to robut, please go right ahead. It's not in a very stable position right now, so any pull requests are welcome as long as they're accompanied by tests.

## License

robut is distributed under the terms of the GPL license. See LICENSE for details.
