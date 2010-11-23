class Entry
  include DataMapper::Resource

  property :slug, String,
  :key => true,
  :length => 6
  property :target, String,
  :unique => true,
  :required => true,
  :format => :url,
  :length => 1..1024
  property :created_at, DateTime
  property :updated_at, DateTime

  validates_length_of :slug, :equals => 6
end
