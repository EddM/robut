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
        created_at = Time.at(object["data"]["created"])

        if comment_kind?(object) &&
           created_at > Robut.configuration.started_at &&
           !self.class.processed_comment_ids.include?(object["data"]["name"])
          process_object(object)
        end
      end

      def self.processed_comment_ids
        @@processed_comment_ids ||= []
      end

      private

      def comment_kind?(object)
        object["kind"] == "t1" # comment
      end

      def process_object(object)
        Robut::ListenerCollection.instance.listeners.each do |listener|
          listener.call(object["data"])
        end
      ensure
        self.class.processed_comment_ids << object["data"]["name"]
      end
    end
  end
end
