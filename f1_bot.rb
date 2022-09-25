require 'discordrb'
token = 'MTAyMzI3Mjk2NzM3Njk5NDQzNw.GaXwn4.vew4jRTNy2YRJYpe_aP9SQWveurWzL6dalgwkg'
bot = Discordrb::Bot.new token: token
userID = 166555724053217281

bot.message(with_text: 'Ping!') do |event|
  event.respond('Pong!')
end
bot.message(with_text: 'Shutdown!') do |event|
    shutDown()
end

def shutDown()
    bot.command(:exit, help_available: false) do |event|
        break unless event.user.id == userID
      
        bot.send_message(event.channel.id, 'Bot is shutting down')
        exit
      end
end

bot.run