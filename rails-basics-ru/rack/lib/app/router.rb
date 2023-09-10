# frozen_string_literal: true

require 'rack'

class Router
  # def initialize(router)
  # @app = app
  # end

  def call(env)
    # BEGIN
    # status, headers, body = self.call(env)
    # [status, headers, body]
    request = Rack::Request.new(env)
    
    if request.path == '/'
      [200,{ 'Content-Type' => 'text/html' },['Hello, World!']]
    elsif request.path == '/about'
      [200,{ 'Content-Type' => 'text/html' },['About page']]
    else
      [404,{ 'Content-Type' => 'text/html' },["404 Not Found"]]
    end
    # END
  end
end
