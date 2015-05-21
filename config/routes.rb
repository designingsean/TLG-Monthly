Rails.application.routes.draw do
  resources :revenues do
    collection do
    end
  end
  resources :expenses do
    collection do
    end
  end
  resources :net do
    collection do
    end
  end
  resources :enrollments do
    collection do
    end
  end
  resources :customers do
    collection do
    end
  end
  resources :churn do
    collection do
    end
  end
  #for testing hireology widget
  resources :test do
    collection do
    end
  end
  root :to => "revenues#index"
end
