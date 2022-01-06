Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: "hello_slacks#greet"
  post "/hello_slacks", to: "hello_slacks#hello_slack"
  post "/posts", to: "posts#create"
end
