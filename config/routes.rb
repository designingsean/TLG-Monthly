Rails.application.routes.draw do
  resources :revenue do
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
  #for testing hireology widget
  resources :test do
    collection do
    end
  end
end
