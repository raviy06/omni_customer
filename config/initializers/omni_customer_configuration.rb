module OmniCustomerConfiguration
  class Config
    def initialize
      @omni_account_url = ENV.fetch('OMNI_ACCOUNT_URL', 'localhost:4000')
    end

    attr_reader :omni_account_url
  end
  
  def self.config
    @config ||= Config.new
  end
end