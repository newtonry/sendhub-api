require 'route'

class MessagesController < ApplicationController
  def create
    input = ActiveSupport::JSON.decode(request.body.read)
    
    if !numbers_valid?(input['recipients'])
      render :json => { :errors => "There was a non-legitimate number" }, :status => 400
    elsif !input.has_key?("message")
      render :json => { :errors => "There was no message" }, :status => 400
    else
      recipients_left = input['recipients']
      routes = []
  
      determine_bucket_sizes(input['recipients'].length).reverse.each do |size|
        routes << Route.new(size, recipients_left[0...size])
        recipients_left = recipients_left[size..-1]
      end

      response = { "message" => input["message"], "routes" => routes }
      render :json => response
    end
  end
end
