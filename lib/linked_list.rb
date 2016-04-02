require_relative 'node'

class LinkedList
  attr_reader :head

  # head takes initial data
  def initialize(node = nil)
    if node
      @head = Node.new(node)
    else
      @head = nil
    end
  end

  def append(new_node)
    # create temporary holder
    current_node = head
    # starts at temporary holder
    if current_node
      until current_node.next_node == nil
      # slide along nodes until empty
        current_node = current_node.next_node
      end
      # connect nodes together by attaching
      # new node to current node
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
    # counter increases for each next_node
    counter = 0
    current_node = head
      until current_node == nil
        current_node = current_node.next_node
      counter += 1
    end
    counter
    # counts how many, but is only registering
    # most recently appended item.
  end

  def prepend(new_node)
    if new_node == nil
      return "This is not a valid request."
    end
    current_node = head
    # @all_nodes << current_node.data
    node_to_prepend = Node.new(new_node)
    node_to_prepend.next_node = current_node
    @head = node_to_prepend
    new_node
    # binding.pry
    # current_node = current_node.next_node
    # binding.pry
    # @all_nodes.unshift(node_to_prepend.data)
  end

  def insert(position, node)
    if node == nil || position > count
      return "This is not a valid request."
    end
    current_node = head
    node_to_insert = Node.new(node)
    if position == 0
      prepend
    else
    (position - 1).times do
      # node_data_collection << current_node.data
      current_node = current_node.next_node
      end
    end
    node_to_insert.next_node = current_node.next_node
    current_node.next_node = node_to_insert
    node
  end

  def find(position, how_many)
    if position > count || how_many > count - position
      return "This is not a valid request."
    end
    # creates temporary head
    current_node = head
    # creates container
    node_request = []
    #slides along nodes and puts in container
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
    # create temporary holder
    current_node = head
    # slide through nodes
    until current_node == nil
      if current_node.data == element
        return true
      end
      current_node = current_node.next_node
    end
    false
    # if node is same as given node return true
    # else keep sliding
    # if not found false
  end

  def pop(how_many = 1)
    if how_many > count
      return "This is not a valid request."
    end 
    # how many nodes are there in total
    number_of_nodes = count
    # set temproary head
    current_node = head
    # create containers to hold popped and unpopped nodes
    # unpopped_nodes = []
    popped_nodes = []
    # slide through nodes until hit number to be popped
    (number_of_nodes - how_many - 1).times do
      # unpopped_nodes << current_node
      current_node = current_node.next_node
    end
    nodes_to_pop = current_node.next_node
    current_node.next_node = nil
    # current_node = nil
    # keep popped nodes to report out
    # how_many.times do
    current_node = nodes_to_pop
    until current_node == nil
    popped_nodes << current_node.data
    current_node = current_node.next_node
    end
    # binding.pry
    # print out popped nodes
    popped_nodes.join(" ")
    # only unpopped nodes remain
    end

end
