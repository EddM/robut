module Robut
  module Listeners
    class CommentListener
      attr_reader :regex

      def initialize(regex, &block)
        @regex, @block = regex, block
      end

      def call(comment)
        if match_data = comment["body"].match(@regex)
          @block.call(comment, match_data)
        end
      end
    end
  end
end
