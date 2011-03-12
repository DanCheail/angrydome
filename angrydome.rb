require 'sinatra/base'
require './lib/carousel'

class Angrydome < Sinatra::Base
  @@carousel = Carousel.new(2, "I'm angry!", "This sucks!")

  get '/' do
    @rant = @@carousel.next    
    erb :index
  end
  
  post '/' do
    @@carousel.push(params[:rant])
    redirect to('/')
  end
  
end