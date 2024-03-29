class BranchesController < ApplicationController
    
    def update_branch_menus
        @branches = Branch.where(company_id: params[:company])
        @model = params[:object].pluralize
        render "#{@model}/update_branch_menus", format: 'js'
    end

   def update_branch_usermenus
        @branches = Branch.where(company_id: params[:company])
        render "users/update_branch_menus", format: 'js'
    end
    
    
   def update_branch_truckmenus
        @branches = Branch.where(company_id: params[:company])
        render "trucks/update_branch_menus", format: 'js'
    end


   def update_branch_trailermenus
        @branches = Branch.where(company_id: params[:company])
        render "trailers/update_branch_menus", format: 'js'
    end    
    
   def update_branch_tireadminmenus
        @branches = Branch.where(company_id: params[:company])
        render "admin/update_branch_menus", format: 'js'
    end    
    
    def index
        @branches = branch.all.order("created_at DESC");
    end
    
    def all
        @company = Company.find(params[:id])
        if (@company != nil)
            @branches = @company.branches.all.order("created_at ASC")
            render json: @branches
        else
            render json: { error: '404 error' }, status: 404
        end
    end
    
    def new
        @branch = Branch.new  
    end
    
    def create
        @branch = Branch.new(branch_params)
        if @branch.save
         flash[:success] = "Welcome to LOGICCS !"    
         redirect_to adminpanel_url
        else
         flash[:danger] = "regist failed !"    
         render 'new'
        end 
    end
    
    def index
      @companies = Company.all
      if (params[:company])
        @target_c = @companies.find(params[:company])
      else
        @target_c = @companies.first
      end
      @branch = Branch.where(companY_id: @target_c).order("created_at ASC")
    end
    
    def destroy
        @branch = Branch.find(params[:id])
        @branch.destroy if (@branch)
        redirect_to branches_url
    end
    
    def edit
        @branch = Branch.find(params[:id])
    end
    
    def update
        @branch = Branch.find(params[:id])
        if (@branch.update(branch_params))
            flash[:success] = "Branch update Done"
            redirect_to branches_url
        else
            render :edit
        end
    end

    private
      def branch_params
        params.require(:branch).permit(:name, :company_id)
      end   
end
 