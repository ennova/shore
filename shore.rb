class Shore < Sinatra::Application
  set :haml, :format => :html5
  set :views, 'views'

  get '/' do
    haml :index
  end

  get '/shorten' do
    entry = Entry.shorten! params[:url]
    content_type 'text/plain', :charset => 'utf-8'
    "http://#{request.env['HTTP_HOST']}/#{entry.slug}"
  end

  get '/:slug' do
    if entry = Entry.get(params[:slug])
      redirect entry.target, 301
    else
      not_found(haml :'404')
    end
  end
end
