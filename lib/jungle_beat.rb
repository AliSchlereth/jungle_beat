require_relative 'linked_list'

class JungleBeat
  attr_reader :beats

  def initialize(beats = nil)
    @beats = beats
  end

  def split_beats
    unless beats == nil
      @beats = beats.split
    end
    beats
  end

end
