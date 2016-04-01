require_relative 'linked_list'

class JungleBeat
  attr_reader :beats, :head

  def initialize(beats = "")
    @beats = beats
  end

  def split_beats
    beats.split
  end

  def initiate_linked_list
    beats = split_beats
    list = LinkedList.new(beats.first)
    beats.shift
    beats.map do |beat|
      list.append(beat)
      @head = list.head
    end
  end

end
