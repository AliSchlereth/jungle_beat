gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require 'pry'

class LinkedListTest <Minitest::Test
  def test_can_use_a_new_list
    list = LinkedList.new("purple")
  end

  def test_it_has_a_dummy_head
    list = LinkedList.new
    assert_equal nil , list.head
  end

  def test_it_takes_data_for_the_head
    list = LinkedList.new("purple")
    assert_equal "purple", list.head.data
  end


  def test_linked_list_can_append_from_nil
    list = LinkedList.new
    list.append("purple")

    assert_equal "purple", list.to_string
  end


  def test_when_one_node_is_appended_the_next_node_is_nil
    list = LinkedList.new
    list.append("purple")

    assert_equal nil, list.head.next_node
  end

  def test_can_append_a_new_node
    list = LinkedList.new("purple")
    list.append("green")

    assert_equal "purple green", list.to_string
  end

  def test_can_append_one_item_to_a_nil_list
    list = LinkedList.new

    assert_equal "purple", list.append("purple")
    assert_equal "purple", list.to_string
  end

  def test_can_append_two_nodes
    list = LinkedList.new("purple")

    assert_equal "green", list.append("green")
    assert_equal "purple green", list.to_string
    assert_equal "blue", list.append("blue")
    assert_equal "purple green blue", list.to_string
  end

  def test_to_string_gathers_all_data_from_nodes
    list = LinkedList.new("purple")

    assert_equal "purple", list.to_string
  end

  def test_it_counts_how_many_nodes
    list = LinkedList.new("purple")
    list.append("green")

    assert_equal 2, list.count
  end

  # How can I test for a call such as list.head.next_node
  # which is supposed to return a node with its data and
  # next_node

  def test_prepend_can_add_item_to_beginning_of_list
    list = LinkedList.new("purple")
    list.prepend("brown")

    assert_equal "brown purple", list.to_string
    assert_equal "brown", list.prepend("brown")
  end

  def test_prepend_can_add_multiple_nodes_to_beginning_of_linked_list
    list = LinkedList.new("purple")
    list.prepend("brown")

    assert_equal "brown purple", list.to_string

    list.prepend("red")

    assert_equal "red brown purple", list.to_string
  end

  def test_prepend_rejects_nil_as_a_new_node
    list = LinkedList.new("purple")

    assert_equal "This is not a valid request.", list.prepend(nil)
  end

  def test_insert_places_new_node_in_any_assigned_position
    list = LinkedList.new("purple")
    list.append("blue")
    assert_equal "green", list.insert(1,"green")

    assert_equal "purple green blue", list.to_string
  end



  def test_insert_rejects_an_argument_of_nil
    list = LinkedList.new("purple")
    list.append("blue")
    assert_equal "This is not a valid request.", list.insert(1, nil)

  end

  def test_find_returns_node_as_given_by_position_and_subsequent_requested_nodes
    list = LinkedList.new("purple")
    list.append("green")
    list.append("blue")
    list.append("indigo")

    assert_equal "purple green blue indigo", list.to_string
    assert_equal "blue indigo", list.find(2,2)
    assert_equal "purple green blue indigo", list.to_string
    assert_equal "blue", list.find(2,1)
    assert_equal "green blue indigo", list.find(1,3)
  end

  def test_find_only_returns_valid_beats
    list = LinkedList.new
    list.append("purple")
    list.append("green")
    assert_equal "This is not a valid request.", list.find(3,1)
  end

  def test_include_returns_true_or_false_respective_to_given_element
    list = LinkedList.new("purple")
    list.append("green")
    list.append("blue")
    list.append("indigo")

    assert list.include?("blue")
    assert_equal true, list.include?("blue")
    assert list.include?("purple")
    assert list.include?("indigo")
    refute list.include?("table")
    assert_equal false, list.include?("false")
  end

  def test_if_list_contains_one_node_does_can_it_still_return_true_for_include
    list = LinkedList.new("purple")

    assert list.include?("purple")
  end

  def test_pop_removes_one_element_from_end_of_linked_list
    list = LinkedList.new("purple")
    list.append("green")
    list.append("blue")
    list.append("indigo")

    assert_equal "indigo", list.pop
    assert_equal "blue", list.pop
  end

  def test_pop_takes_parameter_to_remove_more_than_one_element_of_linked_list
    list = LinkedList.new("purple")
    list.append("green")
    list.append("blue")
    list.append("indigo")

    assert_equal "blue indigo", list.pop(2)
  end

  def test_when_popping_off_elements_only_non_popped_elements_string_out
    list = LinkedList.new("purple")
    list.append("green")
    list.append("blue")
    list.append("indigo")

    assert_equal "blue indigo", list.pop(2)
    assert_equal "purple green", list.to_string
  end

  def test_pop_rejects_request_if_greater_than_the_total_number_of_elements
    list = LinkedList.new
    list.append("purple")
    list.append("green")
    assert_equal "This is not a valid request.", list.pop(3)
  end
end
