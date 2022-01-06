require "net/http"
require "uri"
require "json"

class HelloSlacksController < ApplicationController
  def greet
    render json: { status: "SUCCESS" }
  end

  def hello_slack
    request_data = JSON.parse(request.body.read)
    case request_data["type"]
    when "url_verification"
      render json: request_data
    end
  end
end
