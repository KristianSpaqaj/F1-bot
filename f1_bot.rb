require 'discordrb'
#Fjern token inden commit
token = 'lokalt'
userID = 166555724053217281
bot = Discordrb::Bot.new token: token

bot.message(content: '!ping') do |event|
  event.respond('Pong')
end

bot.run