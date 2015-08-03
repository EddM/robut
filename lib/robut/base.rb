module Robut
  module Base
    def self.extended(base)
      base.extend Robut::Actions
      base.extend Robut::Listeners
    end

    def robut(username, password, options = {}, &block)
      options = { username: username, password: password }.merge(options)
      @configuration = build_configuration(options)
      client.sign_in
      yield(client)
      initialize_event_loop!
    end

    def client
      @client ||= Robut::Client.new(@configuration)
    end

    private

    def build_configuration(options)
      Robut.configuration ||= Robut::Configuration.new(options)
    end

    def initialize_event_loop!
      poller = Robut::Pollers::CommentPoller.new

      loop do
        poller.poll!
        sleep 5
      end
    end
  end
end
