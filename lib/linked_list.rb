require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      last_node.set_next(Node.new(data))
    end
  end

  def count
    nodes = 0
    current_node = @head
    if @head != nil
      nodes = 1
      until current_node.next_node == nil
        nodes += 1
        current_node = current_node.next_node
      end
    end
    nodes
  end

  def to_string
    string = ""
    if @head != nil
      current_node = @head
      string = @head.data
      until current_node == last_node
        current_node = current_node.next_node
        string += " #{current_node.data}"
      end
    end
    string
  end

  def prepend(data)
    if @head == nil
      @head = Node.new(data)
    else
      new_head = Node.new(data)
      new_head.set_next(@head)
      @head = new_head
    end
  end

  def insert(index, data)
    if index > count
      append(data)
    else
      new_node = Node.new(data)
      new_node.set_next(find_node(index))
      previous_node = find_node(index - 1)
      previous_node.set_next(new_node)
    end
  end

  def find(index, number)
    string = "Sorry, no sounds here!"
    unless index > count
      sound = find_node(index)
      sound_index = 1
      string = "#{sound.data}"
      until sound_index == number
        sound_index += 1
        sound = find_node(sound_index)
        string += " #{sound.data}"
      end
    end
    string
  end

  def includes?(data)
    all_sounds.include?(data)
  end

  def pop
    new_last_index = count - 2
    new_last_node = find_node(new_last_index)
    new_last_node.set_next(nil)
  end

  private

  def last_node
    if @head != nil
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
    end
    current_node
  end

  def find_node(index)
    if @head != nil
      current_node = @head
      node_index = 0
      until node_index == index
        current_node = current_node.next_node
        node_index += 1
      end
    end
    current_node
  end

  def all_sounds
    if @head != nil
      sounds = [@head.data]
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
        sounds << current_node.data
      end
    end
    sounds
  end
end
