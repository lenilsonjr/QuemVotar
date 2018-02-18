Rails.application.routes.draw do

  get '/questions', to: 'questions#index', as: :questions

end
