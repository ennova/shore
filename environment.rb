require 'rubygems'
require 'bundler'

Bundler.require

DataMapper::Logger.new($stdout, :info)
Dir.glob('models/*.rb').each { |file| require file }
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/shore")

$API_TOKEN = ENV['API_TOKEN'] || '12345' # That's the kinda thing an idiot would have on his luggage!
