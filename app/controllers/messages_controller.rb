require 'route'

class MessagesController < ApplicationController
  def create
    
    #test phone numbers legitimacy
    numbers_valid?(params['recipients'])
    

    recipients_left = params['recipients']
    routes = []
    
    determine_bucket_sizes(params['recipients'].length).reverse.each do |size|
      routes << Route.new(size, recipients_left[0...size])
      recipients_left = recipients_left[size..-1]
    end
    response = {
      "message" => params["message"],
      "routes" => routes
    }
    
    render :json => response#x.ip#determine_buckets(params['recipients'].length)
  end
end
