gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/jungle_beat'
require 'pry'

class JungleBeatTest <Minitest::Test

  def test_jungle_beat_can_initialize_an_empty_head
    jungle_beat = JungleBeat.new
    assert_equal nil, jungle_beat.split_beats
  end

  def test_jungle_beat_can_split_a_string
    skip
    jungle_beat = JungleBeat.new("purple green")
    assert_equal ["purple", "green"], jungle_beat.split_beats
  end

  def test_jungle_beat_can_use_split_beats_to_create_a_linked_list
    jungle_beat = JungleBeat.new("purple green")

    assert_equal "purple", jungle_beat.initiate_linked_list.head.data
    assert_equal "green", jungle_beat.initiate_linked_list.head.next_node.data
  end
end
