gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'
require_relative '../lib/linked_list'

class Nodetest <Minitest::Test
  def test_it_has_data
    node = Node.new("plop")
    assert_equal "plop", node.data
  end

  def test_it_has_a_next_node_path
    node = Node.new("ploop")
    assert_equal nil, node.next_node
  end

end
