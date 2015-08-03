require "forwardable"

module Robut
  class Client
    extend Forwardable

    def_delegator :@redditkit_client,
                  :signed_in?, :sign_out

    def initialize(configuration)
      @redditkit_client = RedditKit::Client.new
      @redditkit_client.user_agent = configuration.user_agent
      @redditkit_client.sign_in configuration.username, configuration.password

      Robut.logger.info "Successfully signed in as #{configuration.username}"
    end
  end
end
