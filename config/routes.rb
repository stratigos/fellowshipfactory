Rails.application.routes.draw do
  get "up" => "rails/health#show", :as => :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  namespace(:manage) do
    resources(:organizations, except: [:show])

    resources(:people, except: [:show]) do
      member do
        get :list_organizations
      end
    end

    root(controller: :dashboards, action: :index)
  end

  # root(to: "rails/welcome#index")
end
