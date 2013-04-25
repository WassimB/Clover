# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Clover::Application.routes.draw do


  # Resource routes for controller project_memberships
  resources :project_memberships, :only => [:create, :update, :destroy]


  # Resource routes for controller tasks
  resources :tasks, :only => [:edit, :create, :update, :destroy] do
    collection do
      post 'reorder'
    end
  end


  # Resource routes for controller projects
  resources :projects


  # Resource routes for controller phases
  resources :phases, :only => [:new, :edit, :show, :create, :update, :destroy]

  # Owner routes for controller phases
  resources :projects, :as => :project, :only => [] do
    resources :phases, :only => [] do
      get 'new', :on => :new, :action => 'new_for_project'
      collection do
        post 'create', :action => 'create_for_project'
      end
    end
  end


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
