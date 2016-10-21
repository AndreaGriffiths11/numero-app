require 'spec_helper'

describe 'Our Numerology App' do
  include SpecHelper

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
