Rails.application.routes.draw do
  root to: "hello_slacks#greet"
  post "/posts", to: "posts#create"
end
