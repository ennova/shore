$: << File.dirname(__FILE__)

require 'environment'
require 'rake'

namespace :db do
  desc "Auto upgrade the database"
  task :autoupgrade do
    DataMapper.auto_upgrade!
  end
end
