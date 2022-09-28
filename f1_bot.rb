require 'discordrb'
require './credantials'
require 'net/http'
require 'json'
token = $credantials[:token]
$link = URI('http://ergast.com/api/f1/')
bot = Discordrb::Bot.new token: token , client_id: $credantials[:client_id]

bot.message(with_text: 'ping') do |event|
  event.respond 'Pong'
end
def driver_info(driver)
  info = $link + "drivers/#{driver}.json"
  get_info = Net::HTTP.get(info)
  puts get_info
  return get_info
end
bot.message(with_text: /Get driver (\w+)/) do |event|
  event.respond driver_info(event.message.content.split[-1])
end
bot.run true
bot.join