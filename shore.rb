class Shore < Sinatra::Application
  set :haml, :format => :html5
  set :views, 'views'

  get '/' do
    haml :index
  end

  get '/shorten' do
    url = params[:url]
  end

  get '/:slug' do
    params[:slug]
    not_found(haml :'404')
  end
end
