require_relative "./config/environment"
require "sinatra/activerecord/rake"

desc "Start the server"
task :server do  
  if ActiveRecord::Base.connection.migration_context.needs_migration?
    puts "Migrations are pending. Make sure to run `rake db:migrate` first."
    return
  end

  # rackup -p PORT will run on the port specified (9292 by default)
  ENV["PORT"] ||= "9292"
  rackup = "rackup -p #{ENV['PORT']}"

  # rerun allows auto-reloading of server when files are updated
  # -b runs in the background (include it or binding.pry won't work)
  exec "bundle exec rerun -b '#{rackup}'"
end

desc "Start the console"
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc "Create a model: rake create_model FILE_NAME=file_name, use snake_case where required"
task :create_model do
  str = ENV['FILE_NAME'].split("_").map { |s| s[0].upcase + s.slice(1, s.length) }.join("")
  file = "./app/models/#{ENV['FILE_NAME']}.rb"

  if File.exists?(file)
    puts "File already exists!!"
  else
    File.open("./app/models/#{ENV['FILE_NAME']}.rb", "w+") { |f| f.write("class #{str} < ActiveRecord::Base\nend") }
    puts "#{ENV['FILE_NAME']}.rb successfully created!"
  end
end