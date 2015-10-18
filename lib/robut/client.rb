require "forwardable"

module Robut
  class Client
    extend Forwardable

    include Robut::Actions
    include Robut::Listeners

    def_delegators :@redditkit_client,
                   :signed_in?, :sign_out,
                   :submit_comment

    def initialize(configuration)
      @configuration = configuration
      @redditkit_client = RedditKit::Client.new
      @redditkit_client.user_agent = @configuration.user_agent
    end

    def sign_in
      @redditkit_client.sign_in @configuration.username, @configuration.password
      Robut.logger.info "Successfully signed in as #{@configuration.username}"
    end
  end

  def self.client
    @client ||= Robut::Client.new(@configuration)
  end
end
