require "logger"

module Robut
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end
end
