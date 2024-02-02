class User < ApplicationRecord
  rolify
  # rolify
  after_create :set_default_role
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :registerable

  has_many :articles, dependent: :destroy
  
  private
  def set_default_role
    add_role :new_user
  end 
end
