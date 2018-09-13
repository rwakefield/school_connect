class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Accessible
end
