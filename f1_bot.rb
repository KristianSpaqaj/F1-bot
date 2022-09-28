require 'discordrb'
require './credantials'
#Fjern token inden commit
token = $credantials[:token]
userID = 166555724053217281
bot = Discordrb::Bot.new token: token , client_id: $credantials[:client_id]

bot.message(with_text: 'ping') do |event|
  puts 'test'
  event.respond 'Pong'
end
p bot
bot.run true
bot.join