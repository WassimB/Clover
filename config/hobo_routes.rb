# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Clover::Application.routes.draw do


  # Resource routes for controller juniors
  resources :juniors, :only => [:edit, :show, :create, :update, :destroy] do
    collection do
      post 'signup', :action => 'do_signup'
      get 'signup'
    end
    member do
      get 'account'
      put 'activate', :action => 'do_activate'
      get 'activate'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller juniors
  match 'junior_login(.:format)' => 'juniors#login', :as => 'junior_login'
  get 'junior_logout(.:format)' => 'juniors#logout', :as => 'junior_logout'
  match 'junior_forgot_password(.:format)' => 'juniors#forgot_password', :as => 'junior_forgot_password'

end
