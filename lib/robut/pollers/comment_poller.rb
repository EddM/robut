module Robut
  module Pollers
    class CommentPoller < Poller
      def url
        if subreddit = Robut.configuration.subreddit
          "http://www.reddit.com/r/#{subreddit}/comments.json"
        else
          "http://www.reddit.com/comments.json"
        end
      end

      def handle_object(object)
        if object["kind"] == "t1" # comment
          Robut::ListenerCollection.instance.listeners.each do |listener|
            listener.call(object["data"])
          end
        end
      end
    end
  end
end
