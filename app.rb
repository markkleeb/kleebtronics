require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'pony'

DataMapper::setup(:default, ENV['DATABASE_URL'])

class Project
  include DataMapper::Resource

  property :id,     Serial
  property :img_url,  String
  property :img_hover, String
  property :title,  String
  property :year, String
  property :link, String
  property :description, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

# Main route  - this is the form where we take the input
get '/' do
  @page_title = "portfolio"
  @projects = Project.all

  erb :portfolio
  
  
end



get '/about' do
  @page_title = "about"
  
  erb :about
   
  
end


get '/portfolio' do
  
    @page_title = "portfolio"
    @projects = Project.all
  
  erb :portfolio
   
end

get '/portfolio/:id' do

    @projects = Project.all
    @this_project = Project.get(params[:id])
  
  erb :single_project
  
end

  
get '/contact' do
  
  @page_title = "contact"
  
    erb :contact

end


post '/send_email' do
 
  Pony.mail( 
      :from => params[:name] + "<" + params[:email] + ">",
      :to => 'kleeb930@gmail.com',
      :subject => params[:name] + " has sent you an email",
      :body => params[:message]
  )
  redirect '/~mk3981/sinatra/kleebtronics/thanks'
  
end

get '/thanks' do
  
  @page_title = "thanks"
  
  erb :thanks
  
end

get '/addproject' do
  
  @page_title = "addproject"
  
  erb :addproject
  
end


post '/newproject' do
  project = Project.new
  
  project.id = params[:id]
  project.img_url = params[:img_url]
  project.img_hover = params[:img_hover]
  project.title = params[:title]
  project.year = params[:year]
  project.link = params[:link]
  project.description = params[:description]
  
  
  project.save
  
  output = ""
  
  for p in Project.all
    output += <<-HTML
  #{p.img_url}<br/>#{p.title}<br/>#{p.year}<br/>#{p.description}<br/><br/>
  HTML
  end
  output
end
