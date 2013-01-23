require 'rubygems'
require 'sinatra'
require 'haml'
require 'rdiscount'

set :views, 'views'
set :public_folder, 'public'
set :haml, {:format => :html5}

MD_DIR = "views/md/"

get '/' do
  haml :index, :layout => :'layouts/application'
end

get '/clients' do
  haml :clients, :layout => :"layouts/application"
end

get '/download' do
  haml :download, :layout => :"layouts/application"
end

get '/documentation' do
  body = RDiscount.new(File.read(MD_DIR + "README.md")).to_html
  haml :documentation, :layout => :"layouts/application", :locals => {:body => body}
end
