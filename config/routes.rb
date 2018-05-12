Rails.application.routes.draw do
  get 'greetings/hello'

  get 'home/index'
  root 'home#index'

  namespace 'api' do
    namespace 'v1' do

      resources :urlapis do
        collection do
          get 'find_by_short_link'
        end
      end

    end
  end
end
