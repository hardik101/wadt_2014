namespace :members do
  desc "set all old user as confirmed by devise confirmable module"
  task :confirm_existing_member => :environment do
    Member.update_all(:confirmed_at => Time.now)
  end
end