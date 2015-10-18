require "forwardable"

module Robut
  class Configuration
    extend Forwardable

    def_delegator :@attributes, :[]

    def initialize(options = {})
      unless options[:username] && options[:password]
        raise "You must provide both a username and a password"
      end

      @attributes = {
        user_agent: "Robut/#{Robut::Version}",
        subreddit: nil,
        started_at: Time.now - 10000
      }.merge(options)
    end

    def method_missing(method_name, *args, &block)
      if attributes.key?(method_name)
        self[method_name]
      else
        super
      end
    end

    private

    def attributes
      @attributes ||= {}
    end
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configuration
    @configuration
  end
end
