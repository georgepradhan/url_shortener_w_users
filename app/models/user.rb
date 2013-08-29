class User < ActiveRecord::Base
  include BCrypt

  has_many :urls

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(given_email, given_password)
    user = User.find_by_email(given_email)
    user.password == given_password ? user : nil
  end

end
