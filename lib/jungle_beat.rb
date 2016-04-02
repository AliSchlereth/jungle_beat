require_relative 'linked_list'

class JungleBeat
  attr_reader :beats, :list

  def initialize(beats = nil)
    # If I change nil to "" will it still pass the test?
    # Test requires a return of nil
    @beats = beats
    @list = LinkedList.new
    append(beats) if beats
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

  def play
    `say -r 500 -v Boing #{list.to_string}`
  end

end
