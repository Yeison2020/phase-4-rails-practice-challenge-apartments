class TenantsController < ApplicationController

    def create
        tenant = Tenant.create(tenant_params)
        if tenant.valid? 
            render json: tenant, status: :created
        else 
            render json: {error: tenant.errors.full_messages}, status_code: :unprocessable_entity
        end

    end

    def show 
        tenant = Tenant.find(params[:id])
        if tenant.valid? 
            render json: tenant
        else 
            render json: {error: tenant.errors.full_messages}, status_code: :not_found
        end

    end

    def update
        
        tenant = Tenant.find(params:id)
        if tenant
            tenant.update(tenant_params)
        else 
        render json: {error: tenant.errors.full_messages}, status_code: :not_found

        end
        
    end


    def destroy 
        tenant = Tenant.find(params[:id])
        if  
            tenant.destroy
            head :no_content 

        else 
            render json: {error: tenant.errors.full_messages},status_code: :not_found
        end
    end

    def tenant_params
        params.permit(:name, :age)
    end

end
