class LeasesController < ApplicationController

    def create 
        lease = Lease.create(lease_params)
        if lease 
            render json: lease
        else
            render json: {error: lease.errors.full_messages}, status_code: :unprocessable_entity
        end

    end

    def destroy 

        dooomed_lease = Lease.find(params[:id])
        if dooomed_lease 
            dooomed_lease.destroy
            head :no_content 

        else 
            render json: {error: dooomed_lease.errors.full_messages},status_code: :not_found
        end

        


    end



    private 
    def lease_params 
        params.permit(:rent, :tenant_id, :apartment_id)
    end

   

end
