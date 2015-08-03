require "open-uri"

module Robut
  class Poller
    def poll!
      Robut.logger.info "Polling #{url}..."
      data = JSON.parse open(url).read
      data["data"]["children"].each(&method(:handle_object))
    end
  end
end
