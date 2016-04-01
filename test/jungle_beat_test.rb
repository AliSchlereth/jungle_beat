gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/jungle_beat'
require 'pry'

class JungleBeatTest <Minitest::Test

  def test_jungle_beat_can_initialize_an_empty_head
    jungle_beat = JungleBeat.new
    assert_equal [], jungle_beat.split_beats
  end

  def test_jungle_beat_can_split_a_string
    skip
    jungle_beat = JungleBeat.new("purple green")
    assert_equal ["purple", "green"], jungle_beat.split_beats
  end

  def test_jungle_beat_can_split_beats
    jungle_beat = JungleBeat.new("purple green")

    assert_equal ["purple", "green"], jungle_beat.split_beats
  end

  def test_jungle_beats_can_create_linked_list
    jungle_beat = JungleBeat.new("purple green white")

    jungle_beat.initiate_linked_list
    assert_equal "purple", jungle_beat.head.data
    assert_equal "green", jungle_beat.head.next_node.data
    assert_equal "white", jungle_beat.head.next_node.next_node.data
  end
end
