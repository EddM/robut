Robut
======

Robut is a Ruby framework for Reddit bots.

# Installation

    gem install robut

# Usage

## Quick Start

````ruby
require "robut"

robut "My_Bot", "p4ssw0rd" do
  listen /kittens/i do |comment|
    reply_to_comment comment, "Kittens are awesome!"
  end
end
````
