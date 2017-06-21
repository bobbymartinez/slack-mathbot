require 'spec_helper'

describe Goatr::Commands::Default do
  def app
    Goatr::Bot.instance
  end
  it 'mathbot' do
    expect(message: 'mathbot').to respond_with_slack_message(Goatr::ABOUT)
  end
  it 'Mathbot' do
    expect(message: 'Mathbot').to respond_with_slack_message(Goatr::ABOUT)
  end
end
