require './lib/node'
require './lib/linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(sounds)
    split_sounds = sounds.split(" ")
    split_sounds.each {|sound| @list.append(sound)}
  end
end
