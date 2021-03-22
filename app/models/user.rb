class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role, optional: true

  validates :email, presence: true, uniqueness: true
  validates :name, :gender, :date_of_birth, presence: true

  before_create :generate_uid
  after_create :initialize_account
  before_create :set_role

  def customer?
    role.customer?
  end

  def manager?
    role.manager?
  end

  private
    def set_role
      self.role_id = Role.find_by(name: 'Customer', code: 'C').id
    end
    
    def generate_uid
      self.uid = SecureRandom.hex
    end

    def initialize_account
      account = OmniAccount::Account.new(
        customer_id: self.uid,
        customer_name: self.name,
        branch: self.branch,
        minor_indicator: (Date.today.year - self.date_of_birth.year) < 18
      )

      if account.valid?
        account.save
      end
    end
end
