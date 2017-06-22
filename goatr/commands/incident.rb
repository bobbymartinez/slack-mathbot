require 'net/http'
require 'uri'
module Goatr
  module Commands
    class Incident < SlackRubyBot::Commands::Base

      match(/^goatr incident initiate (?<channel_name>\w*)$/i) do |client, data, match|
        client.say(channel: data.channel,
        text: "Making an Incident channel with the name #{match[:channel_name]}...",
        gif:'welcome to the party pal')

        #create a channel with the first 21 characters of supplied name
        response = create_channel(channel_name)
        new_channel_id = get_channel_id(response)
        client.say(channel: data.channel, text: "Incident channel #{match[:channel_name]} successfully created")

      end

      class << self
        def create_channel(channel_name)
          Slack::Web::Client.new(token:ENV['SLACK_USER_TOKEN']).channels_create(name:channel_name[0..20])
        end

        def get_channel_id(response)
          response['channel']['id']
        end

        def incident_name()

        end

      end

    end
  end
end
