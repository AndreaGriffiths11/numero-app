
# we need to tell Rack (remember what Rack is?) that we are just testing.
# normally this is 'development'
ENV['RACK_ENV'] = 'test'

# look in this directory!
$:.unshift File.join(File.dirname(__FILE__))
require_relative File.join(File.dirname(__FILE__), "../index")  # <-- your sinatra app

# require testing gems
require 'rspec'
require 'rack/test'


module SpecHelper
  include Rack::Test::Methods  
  # Rack::Test looks for this app variable
  def app
    Sinatra::Application
  end
    
  # I'm being lazy a.k.a thinking like a programmer
  # Let's map the numerology number to the message with a hash
  # To stretch yourself, you could try this in your web app!
  NUMEROLOGY = {
    "1" => { birthdate: "12151999", message: "One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."},
    "2" => { birthdate: "12161999", message: "This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon." },
    "3" => { birthdate: "12171999", message: "Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter." },
    "4" => { birthdate: "12181999", message: "This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus." },
    "5" => { birthdate: "12191999", message: "This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury." },
    "6" => { birthdate: "12111999", message: "This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus." },
    "7" => { birthdate: "12121999", message: "This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune." },
    "8" => { birthdate: "12131999", message: "This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn." },
    "9" => { birthdate: "12141999", message: "This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars." }
  }  
end
