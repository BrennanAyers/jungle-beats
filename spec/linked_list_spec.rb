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

  it 'can return a string of multiple node' do
    @list.append("boom")
    @list.append("bap")

    expect(@list.to_string).to eq("boom bap")
  end

  it 'can prepend a sound to the list' do
    @list.append("boom")
    @list.append("bap")
    @list.prepend("tss")

    expect(@list.head.data).to eq("tss")

    expect(@list.to_string).to eq("tss boom bap")

    expect(@list.count).to eq(3)
  end

  it 'can prepend an empty list' do
    @list.prepend("tss")

    expect(@list.head.data).to eq("tss")

    expect(@list.to_string).to eq("tss")

    expect(@list.count).to eq(1)
  end

  it 'can insert a sound into a position' do
    @list.append("boom")
    @list.append("bap")
    @list.prepend("tss")
    @list.insert(1, "boom")

    expect(@list.head.data).to eq("tss")

    expect(@list.to_string).to eq("tss boom boom bap")

    expect(@list.count).to eq(4)
  end

  it 'can find a single sound by index' do
    @list.append("boom")
    @list.append("bap")
    @list.prepend("tss")
    @list.insert(1, "boom")

    expect(@list.find(2, 1)).to eq("boom")
  end

  it 'can find multiple sounds by index' do
    @list.append("boom")
    @list.append("bap")
    @list.prepend("tss")
    @list.insert(1, "boom")

    expect(@list.find(1, 3)).to eq("boom boom bap")
  end

  it 'can check if a sound is included' do
    @list.append("boom")
    @list.append("bap")
    @list.prepend("tss")
    @list.insert(1, "boom")

    expect(@list.includes?("boom")).to eq(true)
    expect(@list.includes?("bep")).to eq(false)
  end

  it 'can remove the last sound of the list' do
    @list.append("boom")
    @list.append("bap")
    @list.prepend("tss")
    @list.insert(1, "boom")

    @list.pop

    expect(@list.count).to eq(3)
    expect(@list.to_string).to eq("tss boom boom")
  end
end
