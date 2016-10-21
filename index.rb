require 'sinatra'

def get_birth_path_num(birthdate)
    number = birthdate[0].to_i + birthdate[1].to_i + birthdate[2].to_i + birthdate[3].to_i + birthdate[4].to_i + birthdate[5].to_i + birthdate[6].to_i + birthdate[7].to_i

    number = number.to_s
    number = number[0].to_i + number[1].to_i

    if number > 9
        number = number.to_s
        number = number[0].to_i + number[1].to_i
    end

    return number
end

def get_message(birth_path_num)
  case birth_path_num
  when 1
    message = "Your numerology number is #{birth_path_num}.\nOne is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
  when 2
    message = "Your numerology number is #{birth_path_num}.\nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
  when 3
    message = "Your numerology number is #{birth_path_num}.\nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
  when 4
    message = "Your numerology number is #{birth_path_num}.\nThis is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
  when 5
    message = "Your numerology number is #{birth_path_num}.\nThis is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
  when 6
    message = "Your numerology number is #{birth_path_num}.\nThis is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
  when 7
    message = "Your numerology number is #{birth_path_num}.\nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
  when 8
    message = "Your numerology number is #{birth_path_num}.\nThis is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
  when 9
    message = "Your numerology number is #{birth_path_num}.\nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
  else
    message = "Uh oh! Your birth path number is not 1-9!"
  end
end

get '/:birthdate' do
	setup_index_view
end

get '/message/:birth_path_num' do
   birth_path_num = params[:birth_path_num].to_i
   @message = get_message(birth_path_num)
   erb :index
end

get '/' do
	erb :form
end

post '/' do
  birthdate = params[:birthdate].gsub("-", "")
  if valid_birthdate(birthdate)
    birth_path_num = get_birth_path_num(birthdate)
    redirect "/message/#{birth_path_num}"
  else
    @error = "Oops! You should enter a valid birthdate in the form of mmddyyyy. Try again!"
    erb :form
  end
end

def setup_index_view
	birthdate = params[:birthdate]
	birth_path_num = get_birth_path_num(birthdate)
	@message = get_message(birth_path_num)
	erb :index
end

def valid_birthdate(input)
	if(input.length == 8 && !input.match(/^[0-9]+[0-9]$/).nil?)
		true
	else
		false
	end
end
