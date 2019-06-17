require 'spec_helper'
require './lib/jungle_beat'

describe 'Jungle Beat' do
  before :each do
    @jungle_beat = JungleBeat.new
  end

  it 'has a list with no head' do
    expect(@jungle_beat.list).to_not eq(nil)
    expect(@jungle_beat.list.head).to eq(nil)
  end
end
