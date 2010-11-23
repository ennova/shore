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

  def self.shorten! url
    entry = first(:target => url)

    unless entry
      entry = Entry.new(:target => url)
      entry.raise_on_save_failure = true
      try_count = 0

      begin
        try_count += 1
        entry.slug = ReadableRandom.get(6)
        entry.save
      rescue DataObjects::IntegrityError => e
        raise if try_count >= 10 # safety
        retry if e.message =~ /duplicate key value violates unique constraint "entries_pkey"/
        raise
      end
    end

    entry
  end
end
