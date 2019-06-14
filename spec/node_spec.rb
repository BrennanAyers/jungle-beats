require './spec/spec_helper'
require './lib/node'

RSpec.describe 'Node' do
  before :each do
    @node = Node.new('Test')
  end

  it 'knows its data' do
    expect(@node.data).to eq('Test')
  end

  it 'has no next node' do
    expect(@node.next_node).to eq(nil)
  end

  it 'can set a next node' do
    data = Node.new("Data")
    @node.set_next(data)

    expect(@node.next_node).to eq(data)
  end
end
