namespace :admin_creator do
  desc 'Create admin by passing email and password'
  task :create, [:email, :password] => :environment do |_task, args|
    ActiveRecord::Base.transaction do
      email = args[:email]
      password = args[:password]
      admin = Admin.new(email: email, password: password, password_confirmation: password)
      admin.save!
      puts "Admin created with email: #{email} password: #{password}"
    end
  end
end
