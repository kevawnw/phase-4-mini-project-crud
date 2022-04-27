class SpicesController < ApplicationController

    def index 
        spice = Spice.all
        render json: {
            id: spice.id, title: spice.title, image: spice.image, description: spice.description, notes: spice.notes, rating: spice.rating
        }
    end

    def show
    end


    def create
        spice = Spice.create!(params.permit(:title, :image, :description, :notes, :rating))
        render json: spice, status: 201
        
    end

    def update
        spice = find_spice
        spice.update(params.permit(:title, :image, :description, :notes, :rating))
        render json: spice

    end

    def destroy

    end


    def find_spice
        Spice.find(params[:id])
    end
end
