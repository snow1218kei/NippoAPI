module PostsHelper
  BASE_URL = "https://slack.com/api/"

  def get_username_from_slack
    user_id = params["event"]["user"]
    parameters = URI.encode_www_form({user: user_id})

    uri = URI.parse("#{BASE_URL}/users.info?#{parameters}")

    request = Net::HTTP::Get.new(uri)
    request[:Authorization] = "Bearer #{USER_TOKEN}"

    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    unless response.nil?
      result = JSON.parse(response.body)
      result["user"]["real_name"]
    end
  end

  def this_user
    username = get_username_from_slack
    User.find_by(name: username)
  end

  def same_user?
    !!this_user
  end

  def daily_report?
    params["event"]["text"].match?("日報")
  end
end
