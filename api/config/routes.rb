Rails.application.routes.draw do

  get '/questions', to: 'questions#index', as: :questions
  post '/answers', to: 'answers#create', as: :answers

end
