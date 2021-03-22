class AccountsController <  ApplicationController  
  def show
    @account = OmniAccount::Account.find_by_customer_id(current_user.uid)
  end
end