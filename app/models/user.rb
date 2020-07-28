class User < ActiveRecord::Base
  
  validates :email, uniqueness: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip)
    if user && user.authenticate(password)
      return user
    else 
      return nil
    end
  end
  
  has_secure_password

end