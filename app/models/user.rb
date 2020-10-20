class User < ActiveRecord::Base


  has_secure_password
  # Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, :length => {:within => 6..40}, on: :create
  validates :password_confirmation, presence: true

  # def self.authenticate_with_credentials(email, password)
  #   user = User.find_by(email: params[:login][:email].downcase)
  # end    
  
end
