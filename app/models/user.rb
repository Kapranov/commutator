class User < ActiveRecord::Base
  # attr_accessible :title, :body
  acts_as_authentic do |c|
    c.logged_in_timeout = 55.minutes
    c.validate_login_field = true
    c.validate_password_field = true
    c.login_field = 'login'
  end

  ROLES = %w[admin moderator guest]

end
