require "redditkit"

require "robut/version"

require "robut/configuration"
require "robut/client"
require "robut/logger"

require "robut/listener_collection"
require "robut/listeners"
require "robut/listeners/comment_listener"

require "robut/poller"
require "robut/pollers/comment_poller"

require "robut/actions"

require "robut/base"

extend Robut::Base # Extend the `main` object with the `robut` method
