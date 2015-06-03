require "pry"
require_relative "db/setup"

class String
  def snake_case
    self.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end
end

desc "Run migrations"
namespace :db do
  task :migrate do
    version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
    ActiveRecord::Migrator.migrate('db/migrate', version)
  end
end

desc "Generate migration"
namespace :generate do
  task :migration do |name|
    name = ARGV.pop
    timenumber = Time.now.strftime "%Y%m%d%H%M%S"
    file = "db/migrate/#{timenumber}_#{name.snake_case}.rb"

    File.open file, "w" do |f|
      f.puts %{
class #{name} < ActiveRecord::Migration
  def change
  end
end}.strip
    end

    puts "Generated #{file}"
    exit # otherwise rake will try to run the other arguments
  end
end
