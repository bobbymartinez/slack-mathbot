require 'spec_helper'

describe Goatr::Commands::Help do
  def app
    Goatr::Bot.instance
  end
  it 'help' do
    expect(message: 'mathbot help').to respond_with_slack_message('See https://github.com/dblock/slack-mathbot, please.')
  end
end
