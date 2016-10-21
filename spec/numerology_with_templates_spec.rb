require 'spec_helper'

describe 'Our Numerology App' do
  include SpecHelper
  
  it "has a layout" do
    get '/07041774'
    expect(last_response.body).to include("<title>Numerology App</title>")
  end

  it "has message in a paragraph" do
    get '/01012000'
    expect(last_response.body).to include("<p>Your numerology number is")
  end

  it "responds with success when we pass a birthday" do
    get '/04211999'
    # This is an HTTP status - we'll talk about these later!
    expect(last_response).to be_ok
  end

  SpecHelper::NUMEROLOGY.each do |num, details|
    it "returns the correct number for #{num}" do
      get "/#{details[:birthdate]}"
      expect(last_response.body).to match(/#{details[:message]}/)
    end
  end
end

