class User < ActiveRecord::Base
  # Remember to create a migration!
  # users.password_hash in the database is a :string

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(given_email, given_password)
    user = User.find_by_email(given_email)
    if user.password == given_password
      user
    else
      nil
    end
  end

end

