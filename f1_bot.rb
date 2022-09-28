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
  puts get_info["MRData"]["DriverTable"]
  puts "peeepoo"
  #sorted =  JSON.parse(get_info["MRData"]["DriverTable"])
  return get_info
end
bot.message(with_text: /Get driver (\w+)/) do |event|
  event.respond driver_info(event.message.content.split[-1])
end


test_list = {"MRData":{"xmlns":"http:\/\/ergast.com\/mrd\/1.5","series":"f1","url":"http://ergast.com/api/f1/drivers/alonso.json","limit":"30","offset":"0","total":"1","DriverTable":{"driverId":"alonso","Drivers":[{"driverId":"alonso","permanentNumber":"14","code":"ALO","url":"http:\/\/en.wikipedia.org\/wiki\/Fernando_Alonso","givenName":"Fernando","familyName":"Alonso","dateOfBirth":"1981-07-29","nationality":"Spanish"}]}}}
puts test_list[:MRData][:DriverTable][:Drivers]
bot.run true
bot.join