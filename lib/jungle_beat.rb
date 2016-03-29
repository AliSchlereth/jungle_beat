require 'linked_list'

class JungleBeat

  def initialize(beats)
    split_beats
  end

  def split_beats(beats)
    beats.split.map do |node|
      Node.new(node)
  end
end
