require_relative 'linked_list'

class JungleBeat
  attr_reader :beats, :list
  attr_accessor :rate, :voice

  def initialize(beats = nil)
    # If I change nil to "" will it still pass the test?
    # Test requires a return of nil
    @beats = beats
    @list = LinkedList.new
    append(beats) if beats
    rate = 500
    voice = "Boing"
    # split_beats
  end

  def split_beats(beats = nil)
    unless beats == nil
       split_beats = beats.split
      # Why don't I need @beats if I'm changing beats?
    end
  end

  def append(new_beats)
    beats = split_beats(new_beats)
    beats.map do |beat|
      list.append(beat)
    end
    new_beats
  end

  def count
    list.count
  end

  def prepend(new_beats)
    beats = split_beats(new_beats)
    beats.reverse.map do |beat|
      list.prepend(beat)
    end
    new_beats
  end

  def include?(element)
    list.include?(element)
  end

  def find(position, how_many)
    list.find(position, how_many)
  end

  def pop(how_many)
    list.pop(how_many)
  end

  def insert(position, node)
    beats = split_beats(node)
    beats.reverse.each do |beat|
      list.insert(position, beat)
    end
    node
  end

  def play
    `say -r 500 -v Boing #{list.to_string}`
  end

end
