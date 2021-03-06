require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'do_postgres'
require 'pony'

DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Project
  include DataMapper::Resource

  property :id,     Serial
  property :img_url,  String
  property :img_hover, String
  property :title,  String
  property :year, String
  property :link, String
  property :type, String
  property :description, String
end



# Main route  - this is the form where we take the input
get '/' do
  @page_title = "portfolio"
  @projects = Project.all

  erb :portfolio
  
  
end

get '/reel' do
  @page_title = "reel"

  erb :reel

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

get '/performances' do

    @page_title = "performances"
    @projects = Project.all
  

  erb :performances

end

get '/deathbyarcade' do

    @page_title = "Death By Arcade"
    
  

  erb :deathbyarcade

end

get '/arduinosynth' do

    @page_title = "Arduino Synth"
    
  

  erb :arduinosynth

end

get '/musicalturk' do

    @page_title = "Musical Turk"
    
  

  erb :musicalturk

end

get '/adhesionparadox' do

    @page_title = "Adhesion Paradox"
    
  

  erb :adhesionparadox

end

get '/screambooth' do

    @page_title = "Scream Booth"
    
  

  erb :screambooth

end

  
get '/contact' do
  
  @page_title = "contact"
  
    erb :contact

end


post '/send_email' do
 
  Pony.mail( 
      :from => params[:name] + "<" + params[:email] + ">",
      :to => 'mark@kleebtronics.com',
      :subject => params[:name] + " has sent you an email",
      :body => params[:message],
      :port => '587',
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.sendgrid.net', 
        :port                 => '587', 
        :enable_starttls_auto => true, 
        :user_name            => ENV['SENDGRID_USERNAME'], 
        :password             => ENV['SENDGRID_PASSWORD'], 
        :authentication       => :plain, 
        :domain               => 'heroku.com'
      }
    )
  redirect '/thanks'
  
end

get '/thanks' do
  
  @page_title = "thanks"
  
  erb :thanks
  
end

get '/moshmural' do
  
  @page_title = "moshmural"
  
  erb :moshmural
  
end

get '/zorb' do
  
  @page_title = "zorb"
  
  erb :zorb
  
  end

get '/thejob' do
  
  @page_title = "thejob"
  
  erb :thejob
  
end

get '/sequencer' do
  
  @page_title = "sequencer"
  
  erb :sequencer
  
end

get '/dbaanimation' do
  
  @page_title = "dbaanimation"
  
  erb :dbaanimation
  
end

get '/printingcode' do
  
  @page_title = "printingcode"
  
  erb :printingcode
  
end

get '/fractalearrings' do
  
  @page_title = "fractalearrings"
  
  erb :fractalearrings
  
  end

  get '/jewelry' do
  
  @page_title = "jewelry"
  
  erb :jewelry
  
  end

get '/voronoi' do
  
  @page_title = "voronoi"
  
  erb :voronoi
  
end

get '/touchbar' do
  
  @page_title = "touchbar"
  
  erb :touchbar
  
end

get '/waitinggame' do
  
  @page_title = "waitinggame"
  
  erb :waitinggame
  
  end

get '/powersupply' do
  
  @page_title = "powersupply"
  
  erb :powersupply
  
  end

  get '/nerdyderby' do
  
  @page_title = "nerdyderby"
  
  erb :nerdyderby
  
  end

get '/videomixer' do
  
  @page_title = "videomixer"
  
  erb :videomixer
  
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
  project.type = params[:type]
  project.description = params[:description]
  
  
  if project.save
  
    status 201
    output = ""
  
   for p in Project.all
     output += <<-HTML
     #{p.img_url}<br/>#{p.title}<br/>#{p.year}<br/>#{p.description}<br/><br/>
      HTML
      end
      output
  else
    status 412
    redirect '/addproject'
    end
  
end

DataMapper.finalize
DataMapper.auto_upgrade!
