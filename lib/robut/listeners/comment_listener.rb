module Robut
  module Listeners
    class CommentListener
      attr_reader :regex

      def initialize(regex, &block)
        @regex, @block = regex, block
      end

      def call(comment)
        @block.call(comment) if @regex =~ comment["body"]
      end
    end
  end
end
