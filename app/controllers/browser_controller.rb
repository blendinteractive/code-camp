require 'reloader/sse'
class BrowserController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
      loop do 
        sse.write({:time => Time.now })
        sleep 1
      end
    rescue IOError
      # Disconnects cause an IOError
    ensure
      sse.close
    end
  end

end
