require 'json'
require 'rest-client'
require 'rspec'

describe "Message API" do
  url = 'http://sendhub-rvkn.herokuapp.com/messages'
  content_type = 'application/json'

  it "should give two routes for 6 numbers" do
    params = '{ "message":"SendHubRocks", "recipients":["5555555556","5555555555","5555555554","5555555553", "5555555552","5555555551"]}'
    response = JSON.parse(RestClient.post(url, params, :content_type => content_type))
    expect(response['routes'].length).to eq(2)
  end

  it "should give one route for 5 numbers" do
    params = '{ "message":"SendHubRocks", "recipients":["5555555555","5555555554","5555555553", "5555555552","5555555551"]}'
    response = JSON.parse(RestClient.post(url, params, :content_type => content_type))
    expect(response['routes'].length).to eq(1)
  end
  
  it "should give three routes for 31 numbers" do
    numbers = (5555555500..5555555530).map{|num|  '"' + num.to_s + '"'}.join(',')
    params = '{ "message":"SendHubRocks", "recipients":[' + numbers + ']}'
    response = JSON.parse(RestClient.post(url, params, :content_type => content_type))
    expect(response['routes'].length).to eq(3)
  end
  # 
  it "should give bad request for non-legit numbers" do
    params = '{ "message":"SendHubRocks", "recipients":["55555555","+5555555554","5555555553", "5555555552","5555555551"]}'
    
    RestClient.post(url, params, :content_type => content_type) do |response|
      expect(response.code).to eq(400)
      expect(JSON.parse(response)['errors']).not_to be_empty
    end
  end
  
  it "should give a bad request if there is no message" do
    params = '{"recipients":["5555555552","5555555551"]}'
    RestClient.post(url, params, :content_type => content_type) do |response|
      expect(response.code).to eq(400)
      expect(JSON.parse(response)['errors']).not_to be_empty
    end
  end
end