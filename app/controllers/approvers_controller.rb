class ApproversController < ApplicationController
    
    
    def index
        @approvers = Approver.all
    end
    
    def new
        @companies = Company.all
        @ap_person = Approver.new
    end
    
    
    def create
        
        @approver = Approver.new(approver_params)
        if (@approver.save)
            flash[:alert] = "Approver Registration Succeeded"
            redirect_to adminpanel_url

        else
            flash[:alert] = "Approver Registration Failed"
            render 'new' 
        end
    end

    def update
        @ap_person = Approver.find(params[:id])
        if (@ap_person.update(approver_params))
                redirect_to adminpanel_url
        else
            render :edit
        end
    end
    
    def destroy
        @approver = Approver.find(params[:id])
        @approver.destroy if (@approver)
        redirect_to adminpanel_url
    end
        
    
    def edit
        @companies = Company.all
        @ap_person = Approver.find(params[:id])
    end
    

    private
    
    def approver_params
       params.require(:approver).permit(:company_id, :name, :email) 
    end
end
