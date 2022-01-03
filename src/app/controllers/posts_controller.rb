require "net/http"
require "uri"
require "json"

class PostsController < ApplicationController
  def create
    uri = URI.parse("https://hooks.slack.com/services/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")
    r = Net::HTTP::Post.new(uri)
    r.content_type = "application/json"
    r.body = JSON.dump({
      "text" => "Hello, World!",
    })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(r)
    end
  end
end
