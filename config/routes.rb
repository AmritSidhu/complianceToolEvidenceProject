Rails.application.routes.draw do
  get '/posts/admin' => 'posts#admin'
  get '/posts/:id/user_edit' => 'posts#user_edit', as: :user_edit

  post '/posts/:id/admin' => 'posts#admin'

  resources :posts  #Instead of declaring separate routes for your index, show, new, edit, create, update and destroy actions,
                    #a resourceful route declares them in a single line of code.
  root to: 'posts#index'
end
