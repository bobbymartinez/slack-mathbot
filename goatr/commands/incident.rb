module Goatr
  module Commands
    class Incident < SlackRubyBot::Commands::Base
      command 'incident' do |client, data, _match|
        client.say(channel: data.channel, text: "No incidents yet, sorry. Here is the data #{data.channel.to_s}", gif: 'fire')
      end
    end
  end
end
