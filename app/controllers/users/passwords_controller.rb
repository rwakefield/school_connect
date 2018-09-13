class Users::PasswordsController < Devise::PasswordsController
  include Accessible
end
