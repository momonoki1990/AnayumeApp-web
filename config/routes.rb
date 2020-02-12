Rails.application.routes.draw do
  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'users/following'

  get 'users/followers'

  get 'static_pages/home'

  get 'sessions/new'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'password_resets_controller/new'

  get 'password_resets_controller/edit'

  get 'dreams/show'

  get 'likes/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
