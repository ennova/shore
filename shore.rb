class Shore < Sinatra::Application
  set :haml, :format => :html5
  set :views, 'views'

  helpers do
    def protected!
      unless authorized?
        response['WWW-Authenticate'] = %(Basic realm="Shore API")
        throw(:halt, [401, "Not authorized\n"])
      end
    end

    def authorized?
      @auth ||= Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['', $API_TOKEN]
    end
  end

  get '/' do
    haml :index
  end

  get '/shorten' do
    protected!
    entry = Entry.shorten! params[:url]
    content_type 'text/plain', :charset => 'utf-8'
    "http://#{request.env['HTTP_HOST']}/#{entry.slug}"
  end

  get '/stylesheet.css' do
    scss :stylesheet
  end

  get '/:slug' do
    if entry = Entry.get(params[:slug])
      redirect entry.target, 301
    else
      not_found(haml :'404')
    end
  end
end
