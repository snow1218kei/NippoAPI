require "net/http"
require "uri"
require "json"

USER_TOKEN = "xoxp-2498950469168-2481535990788-2893521595015-e0032ce859a85570ab43c7169ef4ccd1"

class PostsController < ApplicationController
  include PostsHelper
  before_action :require_user_is_registered, :require_daily_report

  def create
    post = this_user.posts.build(post_params)
    post.save
  end

  private

  def post_params
    params.require(:event).permit(:text)
  end

  def require_user_is_registered
    unless same_user?
      exit
    end
  end

  def require_daily_report
    unless daily_report?
      exit
    end
  end
end
