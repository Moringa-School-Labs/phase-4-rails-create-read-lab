class PlantsController < ApplicationController
    def index 
        plants = Plant.all 
        render json: plants
    end  
    
    def show 
        bird = Plant.find_by(id: params[:id])
        if bird
        render json: bird
        else
            render json: {error: "Bird not found!"}, status: :not_found
        end
    end

    def create 
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private

    def plant_params 
        params.permit(:name, :image, :price)
    end

end
