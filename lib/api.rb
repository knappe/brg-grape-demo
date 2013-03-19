module BrgGrapeDemoAPI
  class API < Grape::API
    prefix "api"
    version 'v1', :using => :path
    format :json

    helpers do
      def format_response(data, success = true, error = nil)
        if error
          {:success => false, :data => [], :error => error}
        else
          if data.is_a? Array
            {:success => success, :data => data}
          else
            {:success => success, :data => [data]}
          end
        end
      end
    end
    
    resource :cars do
      get do
        format_response(Car.all)
      end

      post do
        params do
          requires :name,  type => String
          requires :year, type => Integer
          requires :category, type => String
          requires :manufacturer, type => String
          requires :mileage, type => Integer
          requires :seats, type => Integer
        end

        car = Car.new(:name => params[:name],
                      :year => params[:year],
                      :category => params[:category],
                      :manufacturer => params[:manufacturer],
                      :mileage => params[:mileage],
                      :seats => params[:seats])
        if car.save
          format_response(car)
        else
          format_response([], false, car.errors.full_messages)
        end

      end

      get ':id/name' do
        format_response(Car.find(params[:id]).name)
      end

      get ':id/model' do
        format_response(Car.find(params[:id]).model)
      end

      get ':id/year' do
        format_response(Car.find(params[:id]).year)
      end

      get ':id/mileage' do
        format_response(Car.find(params[:id]).mileage)
      end

      get ':id/category' do
        format_response(Car.find(params[:id]).category)
      end

    end
  end
end
