class User < ActiveRecord::Base
  
  validates :username, :first_name, :last_name, :email, :password, :presence => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,5})\Z/

  def self.authenticate(username, password)
    @user = User.find_by_username_and_password(username, password)
    password == @user.password ? @user : nil#User.errors

  end
end
