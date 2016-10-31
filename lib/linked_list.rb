require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize(node = nil)
    if node
      @head = Node.new(node)
    else
      @head = nil
    end
  end

  def append(new_node)
    current_node = head
    if current_node
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(new_node)
    else
      @head = Node.new(new_node)
    end
    new_node
  end

  def to_string
    current_node = head
    node_data_collection = []
    until current_node == nil
      node_data_collection << current_node.data
      current_node = current_node.next_node
    end
    node_data_collection.compact.join(" ")
  end

  def count
    counter = 0
    current_node = head
      until current_node == nil
        current_node = current_node.next_node
      counter += 1
    end
    counter
  end

  def prepend(new_node)
    if new_node == nil
      return "This is not a valid request."
    end
    current_node = head
    node_to_prepend = Node.new(new_node)
    node_to_prepend.next_node = current_node
    @head = node_to_prepend
    new_node
  end

  def insert(position, node)
    return "This is not a valid request." if node == nil || position > count
    current_node = head
    current_node = find_position(position, current_node)
    attach_new_node(current_node, node)
    node
  end

  def attach_new_node(current_node, node)
    node_to_insert           = Node.new(node)
    node_to_insert.next_node = current_node.next_node
    current_node.next_node   = node_to_insert
  end

  def find_position(position, current_node)
    if position == 0
      prepend
    else
      slide_along_nodes(position,current_node)
    end
  end

  def slide_along_nodes(position, current_node)
    (position - 1).times do
      current_node = current_node.next_node
    end
    current_node
  end

  def find(position, how_many)
    if position > count || how_many > count - position
      return "This is not a valid request."
    end
    current_node = head
    node_request = []
    unless current_node == nil
      (position).times do
      current_node = current_node.next_node
      end

      how_many.times do
        node_request << current_node.data
        current_node = current_node.next_node
      end
    end
    node_request.join(" ")
  end

  def include?(element)
    current_node = head
    until current_node == nil
      if current_node.data == element
        return true
      end
      current_node = current_node.next_node
    end
    false
  end

  def pop(how_many = 1)
    if how_many > count
      return "This is not a valid request."
    end
    number_of_nodes = count
    current_node = head
    popped_nodes = []
    (number_of_nodes - how_many - 1).times do
      current_node = current_node.next_node
    end
    nodes_to_pop = current_node.next_node
    current_node.next_node = nil
    current_node = nodes_to_pop
    until current_node == nil
      popped_nodes << current_node.data
      current_node = current_node.next_node
    end
    popped_nodes.join(" ")
  end

end
