class MessagesController < ApplicationController
  def create
    
    render :json => determine_buckets(params['recipients'].length)
  end
end
