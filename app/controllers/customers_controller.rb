class CustomersController < ApplicationController
  load_and_authorize_resource :class => "User"
  before_action :set_customer, except: :index
  before_action :set_account, except: [:index, :update]

  def index
    @customers = User.all
  end

  def show
  end

  def edit
  end

  def update    
    if @customer.update(customer_params)
      redirect_to users_path, notice: 'Customer Updated'
    else
      render :edit, alert: 'Customer could not be updated'
    end
  end

  private
    def set_customer
      @customer = User.find params[:id]
    end

    def set_account
      @account = OmniAccount::Account.find_by_customer_id(@customer.uid)
    end

    def customer_params
      params.require(:user).permit(:name, :email, :date_of_birth, :gender)
    end
end