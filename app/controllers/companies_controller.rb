class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all.order("created_at DESC").page(params[:page]);
    end
    
    def new
        @company = Company.new  
    end
    
    def create
        @company = Company.new(company_params)
        if @company.save
         flash[:success] = "Welcome to LOGICCS !"    
         redirect_to adminpanel_url
        else
         render 'new'
        end 
    end
    
    def index
        @companies = Company.all.order("created_at ASC")
    end
    
    def all
        @companies = Company.all.order("id ASC")
        render json: @companies
    end
    
    def edit
        @company = Company.find(params[:id])
    end
    
    def destroy
        @company = Company.find(params[:id])
        @company.destroy if (@company)
        redirect_to companies_url
    end
    
    private
      def company_params
        params.require(:company).permit(:name_e, :name_j)
      end   
end
