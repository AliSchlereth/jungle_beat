gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/jungle_beat'
require 'pry'

class JungleBeatTest <Minitest::Test

  def test_jungle_beat_can_initialize_an_empty_head
    jungle_beat = JungleBeat.new
    assert_equal nil, jungle_beat.list.head
  end

  def test_jungle_beat_can_split_a_string
    jungle_beat = JungleBeat.new

    assert_equal ["purple", "green"], jungle_beat.split_beats("purple green")
  end

  def test_jungle_beat_can_append_to_a_current_linked_list
    jungle_beat = JungleBeat.new
    jungle_beat.append("purple green")

    assert_equal "purple", jungle_beat.list.head.data
    assert_equal "green", jungle_beat.list.head.next_node.data
    assert_equal "purple green", jungle_beat.append("purple green")
  end

  def test_jungle_beat_can_initiate_a_linked_list_given_a_string
    jungle_beat = JungleBeat.new("purple green")

    assert_equal "purple", jungle_beat.list.head.data
    assert_equal "green", jungle_beat.list.head.next_node.data
  end

  def test_jungle_beat_can_count_how_many_total_elements_in_the_linked_list
    jungle_beat = JungleBeat.new
    jungle_beat.append("purple green")
    jungle_beat.append("blue indigo")
    assert_equal 4, jungle_beat.count
  end

  def test_jungle_beat_can_play_given_beats
    jungle_beat = JungleBeat.new
    jungle_beat.append("purple green")
    jungle_beat.append("blue indigo")
    jungle_beat.play
  end

end
