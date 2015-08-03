require "forwardable"
require "singleton"

module Robut
  class ListenerCollection
    include Singleton
    extend Forwardable

    def_delegator :listeners, :<<

    def listeners
      @listeners ||= []
    end
  end
end
