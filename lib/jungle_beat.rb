require_relative 'linked_list'

class JungleBeat
  attr_reader :beats

  def initialize(beats = nil)
    @beats = beats
    split_beats
  end

  def split_beats
    unless beats == nil
      @beats = beats.split
    end
    beats
  end

  def initiate_linked_list
    if beats == nil
      list = LinkedList.new(beats)
    else
      list = LinkedList.new(beats.shift)
    # Take argument of split beats
    # first beat create a new linked list
        unless beats.count == 0
          beats.map do |beat|
          list.append(beat)
        end
      list
      binding.pry
      end

    # any further beats get added on to said linked list
    # result should be a complete linked list
  end
  end

end
