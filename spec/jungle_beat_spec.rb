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

  it 'can append multiple sounds' do
    @jungle_beat.append("boom bam bip")

    expect(@jungle_beat.list.head.data).to eq("boom")
    expect(@jungle_beat.list.next_node.data).to eq("bam")
    expect(@jungle_beat.count).to eq(3)
  end
end
