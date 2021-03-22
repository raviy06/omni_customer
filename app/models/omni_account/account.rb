class OmniAccount::Account
  include ActiveModel::Model
  include ActiveModel::Serialization
  include ActiveModel::Validations
  include ActiveModel::Attributes

  attr_accessor :customer_id, :customer_name, :branch, :minor_indicator, :uid, :account_type, :opened_at, :self_url

  validates :customer_id, :customer_name, :branch, :minor_indicator, presence: true

  attribute :date_of_birth, :datetime

  class << self
    def from_user user
      OmniAccount::Account.new(
        customer_id: user.uid,
        customer_name: user.name,
        branch: user.branch,
        minor_indicator: (Date.today.year - user.date_of_birth.year) < 18
      )
    end

    def find_by_customer_id id
      response = Typhoeus.get("#{OmniCustomerConfiguration.config.omni_account_url}/api/v1/accounts/#{id}")
      response.success? ? serialize_account(JSON.parse(response.body)) : false
    end

    private
      def serialize_account data
        account = self.new(
          data['data']['attributes']
        )
        account.self_url = data['data']['links']['self']
        account
      end
  end

  def attributes
    {
      'customer_name': nil,
      'customer_id': nil,
      'branch': nil,
      'minor_indicator': nil
    }
  end

  def save
    response = Typhoeus.post("#{OmniCustomerConfiguration.config.omni_account_url}/api/v1/accounts", body: { account: self.serializable_hash })
    response.success? ? serialize_account(JSON.parse(response.body)) : false
  end

  def update
    response = Typhoeus.patch(self.self_url, body: { account: self.serializable_hash })
    response.success? ? serialize_account(JSON.parse(response.body)) : false
  end

  private
    def serialize_account data
      account = OmniAccount::Account.new(
        data['data']['attributes']
      )
      account.self_url = data['data']['links']['self']
      account
    end
end