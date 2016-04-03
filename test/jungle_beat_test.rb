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

  def test_jungle_beat_can_prepend_multiple_nodes_from_a_string
    jungle_beat = JungleBeat.new
    jungle_beat.append("green")
    jungle_beat.prepend("brown purple")
    assert_equal "brown purple green", jungle_beat.list.to_string
    assert_equal "brown purple", jungle_beat.prepend("brown purple")
  end

  def test_jungle_beat_can_test_for_included_elements
    jungle_beat = JungleBeat.new
    jungle_beat.append("purple green blue")
    assert jungle_beat.include?("purple")
  end

  def test_jungle_beat_can_find_and_element_given_parameters
    jungle_beat = JungleBeat.new
    jungle_beat.append("purple green blue")
    assert_equal "green", jungle_beat.find(1,1)
  end

  def test_jungle_beat_can_remove_a_given_number_off_the_end_of_a_list
    jungle_beat = JungleBeat.new
    jungle_beat.append("purple green blue indigo")
    assert_equal "indigo", jungle_beat.pop(1)
    assert_equal "purple green blue", jungle_beat.list.to_string
    assert_equal "green blue", jungle_beat.pop(2)
    assert_equal "purple", jungle_beat.list.to_string
  end

  def test_jungle_beat_can_insert_one_element
    jungle_beat = JungleBeat.new
    jungle_beat.append("purple green indigo")
    jungle_beat.insert(2, "blue")
    assert_equal "purple green blue indigo", jungle_beat.list.to_string
  end

  def test_jungle_beat_can_insert_multiple_nodes
    jungle_beat = JungleBeat.new
    jungle_beat.append("purple indigo")
    assert_equal "green blue", jungle_beat.insert(1, "green blue")
    assert_equal "purple green blue indigo", jungle_beat.list.to_string
  end

  def test_jungle_beat_can_play_given_beats
    jungle_beat = JungleBeat.new
    jungle_beat.append("purple green")
    jungle_beat.append("blue indigo")
    jungle_beat.play
  end

  # def test_jungle_beat_can_take_requests_for_voice
  #   jungle_beat = JungleBeat.new("purple green blue indigo")
  #   jungle_beat.voice = "Alice"
  #   jungle_beat.play
  # end

end
