require 'net/http'
require 'uri'
module Goatr
  module Commands
    class Incident < SlackRubyBot::Commands::Base
      @ops_slack_usergroup_handle = ENV['OPS_SLACK_USERGROUP_HANDLE']
      @slack_user_token = ENV['SLACK_USER_TOKEN']

      match(/^goatr incident initiate (?<channel_name>\w*)$/i) do |client, data, match|
        client.say(channel: data.channel,
        text: "Making an Incident channel with the name #{match[:channel_name]}...",
        gif:'welcome to the party pal')

        #create a channel with the first 21 characters of supplied name
        response = create_channel(match[:channel_name])
        new_channel_id = get_channel_id(response)
        client.say(channel: data.channel, text: "Incident channel #{match[:channel_name]} successfully created.")
        client.say(channel: data.channel, text: "Now starting the goat rodeo.  Inviting Ops to channel with IDS #{get_usergroup_users}")

      end

      class << self
        def create_channel(channel_name)
          Slack::Web::Client.new(token:@slack_user_token).channels_create(name:channel_name[0..20])
        end

        def get_usegroups
          Slack::Web::Client.new(@slack_user_token).usergroups_list
        end

        def get_usergroup_id(usergroup_handle,response)
          response['usergroups'].select{|usergroup| usergroup['handle'] == usergroup_handle}.first["id"]
        end

        #this method isn't working for some reason. I'll look into submitting
        #a patch at some point, for now, hardcoding ops user ids.
        def get_usergroup_users(usergroup_id)
          ENV['OPS_SLACK_IDS'].split(",")
          #Slack::Web::Client.new(token:@slack_user_token).usergroups_users(usergroup_id)
        end

        def get_channel_id(response)
          response['channel']['id']
        end

        def inivite_users()

        end

        def incident_name()

        end

      end

    end
  end
end
