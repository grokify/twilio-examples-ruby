# https://www.twilio.com/docs/voice/tutorials/how-to-respond-to-incoming-phone-calls-ruby
require 'sinatra'
require 'twilio-ruby'

post '/twiml' do
  quotes = [
    "The only source of knowledge is the experience.",
    "We cannot solve our problems with the same thinking we used to create them.",
    "Imagination is everything.",
    "Learn from yesterday, live for today, hope for tomorrow.",
    "Anyone who has never made a mistake has never tried anything new."
  ]
  quote = quotes.sample
  quote = quotes[1]

  quote = 'We observe today not a victory of party but a celebration of freedom--symbolizing an end as well as a beginning--signifying renewal as well as change. For I have sworn before you and Almighty God the same solemn oath our forbears prescribed nearly a century and three-quarters ago.     The world is very different now. For man holds in his mortal hands the power to abolish all forms of human poverty and all forms of human life. And yet the same revolutionary beliefs for which our forebears fought are still at issue around the globe--the belief that the rights of man come not from the generosity of the state but from the hand of God.     We dare not forget today that we are the heirs of that first revolution. Let the word go forth from this time and place, to friend and foe alike, that the torch has been passed to a new generation of Americans--born in this century, tempered by war, disciplined by a hard and bitter peace, proud of our ancient heritage--and unwilling to witness or permit the slow undoing of those human rights to which this nation has always been committed, and to which we are committed today at home and around the world.     Let every nation know, whether it wishes us well or ill, that we shall pay any price, bear any burden, meet any hardship, support any friend, oppose any foe to assure the survival and the success of liberty.     This much we pledge--and more.'

  # Start our TwiML response
  Twilio::TwiML::VoiceResponse.new do |r|
    r.pause length: 5
    # Use <Say> to give the caller some instructions
    r.say message: quote, voice: 'alice'
  end.to_s
end