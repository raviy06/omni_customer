class Role < ApplicationRecord
  has_many :users

  validates :name, :code, presence: true, uniqueness: true

  def customer?
    code == 'C'
  end

  def manager?
    code == 'M'
  end
end
