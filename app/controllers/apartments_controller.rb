class ApartmentsController < ApplicationController

    
    def create
        apartment = Apartment.create(apartment_params)
        if apartment
            render json: apartment, status: :created
        else 
            render json: {error: apartment.errors.full_messsages}, status_code: :unprocessable_entity
        end

    end

    def show 
        apartment = Apartment.find(params[:id])
        if apartment
            render json: apartment
        else 
            render json: {error: apartment.errors.full_messages}, status_code: :not_found
        end

    end

    def update
        
        apartment = Apartment.find(params[:id])
        if apartment
            apartment.update(apartment_params)
            render json: apartment
        else 
        render json: {error: apartment.errors.full_messages}, status_code: :not_found

        end
        
    end


    def destroy 
        apartment = Apartment.find(params[:id])
        if  
            apartment.destroy
            head :no_content 

        else 
            render json: {error: apartment.errors.full_messages},status_code: :not_found
        end
    end

    def apartment_params

        params.permit(:number)

    end
end
