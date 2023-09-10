# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    
    

    # map /^admin\/*/ do
    #   [403, {}, ['403']]
    # end
    uri = %r{\/admin\/*}
    if request.path =~ uri
      [403, {}, ['403']]
    else
      [status, headers, body]
    end
    # END
  end
end
