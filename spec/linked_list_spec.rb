require 'spec_helper'
require './lib/linked_list'

describe 'Linked List' do
  before :each do
    @list = LinkedList.new
  end

  it 'has no head' do
    expect(@list.head).to eq(nil)
  end

  it 'can create a node with append' do
    @list.append("Test")
    expect(@list.head.data).to eq("Test")
  end

  it 'makes a new node with no next node' do
    @list.append("Test")
    expect(@list.head.next_node).to eq(nil)
  end

  it 'can append a node to the next node' do
    @list.append("Test")
    @list.append("Tset")
    expect(@list.head.next_node.data).to eq("Tset")
  end

  it 'can return a count of its nodes' do
    @list.append("Test")
    expect(@list.count).to eq(1)

    @list.append("Tset")
    expect(@list.count).to eq(2)
  end

  it 'can return a string of a single node' do
    @list.append("boom")
    expect(@list.to_string).to eq("boom")
  end
end
