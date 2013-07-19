require 'reloader/sse'
class BrowserController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
      directories = [
        File.join(Rails.root, 'app', 'assets'),
        File.join(Rails.root, 'app', 'views'),
      ]
      fsevent = FSEvent.new

      fsevent.watch(directories) do |dirs|
        sse.write({ :dirs => dirs }, :event => 'refresh')
      end
      fsevent.run  
    rescue IOError
      # Disconnects cause an IOError
    ensure
      sse.close
    end
  end
end
