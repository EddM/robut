module Robut
  module Base
    def robut(username, password, options = {}, &block)
      options = { username: username, password: password }.merge(options)
      @configuration = build_configuration(options)
      Robut.client.sign_in
      Robut.client.instance_eval(&block)
      initialize_event_loop!
    end

    private

    def build_configuration(options)
      Robut.configuration ||= Robut::Configuration.new(options)
    end

    def initialize_event_loop!
      poller = Robut::Pollers::CommentPoller.new

      loop do
        poller.poll!
        sleep 10
      end
    end
  end
end
