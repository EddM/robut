require "singleton"
require "forwardable"

module Robut
  module Listeners
    # Listens for comments matching the given regex
    def listen(regex, &block)
      Robut::ListenerCollection.instance << Robut::Listeners::CommentListener.new(regex, &block)
    end

    def _listeners
      @listeners ||= []
    end
  end
end
