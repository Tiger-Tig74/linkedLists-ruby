# Node class represents a single element in a linked list.
# It contains a value and a reference to the next node.
class Node
  attr_accessor :value, :next_node

  # Initializes a new Node with a given value and optional next_node.
  # @param value [Object] the value to store in the node.
  # @param next_node [Node, nil] the next node in the list (default: nil).
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# LinkedList class represents a singly linked list.
# It provides methods to manipulate the list, such as adding, removing, and finding nodes.
class LinkedList
  # Returns the first node in the list.
  # @return [Node, nil] the first node, or nil if the list is empty.
  attr_reader :head

  # Initializes an empty LinkedList.
  def initialize
    @head = nil
  end

  # Adds a new node with the given value to the end of the list.
  # @param value [Object] the value to add.
  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node = new_node
    end
  end

  # Adds a new node with the given value to the start of the list.
  # @param value [Object] the value to add.
  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  # Returns the total number of nodes in the list.
  # @return [Integer] the size of the list.
  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  # Returns the last node in the list.
  # @return [Node, nil] the last node, or nil if the list is empty.
  def tail
    return nil if @head.nil?

    current = @head
    current = current.next_node while current.next_node
    current
  end

  # Returns the node at the given index.
  # @param index [Integer] the index of the node to return.
  # @return [Node, nil] the node at the specified index, or nil if out of bounds.
  def at(index)
    current = @head
    count = 0
    while current
      return current if count == index

      count += 1
      current = current.next_node
    end
    nil
  end

  # Removes the last element from the list.
  # @return [void]
  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      @head = nil
    else
      current = @head
      current = current.next_node while current.next_node&.next_node
      current.next_node = nil
    end
  end

  # Checks if the list contains a node with the given value.
  # @param value [Object] the value to check for.
  # @return [Boolean] true if the value is found, false otherwise.
  def contains?(value)
    current = @head
    while current
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  # Finds the index of the node containing the given value.
  # @param value [Object] the value to search for.
  # @return [Integer, nil] the index of the node, or nil if not found.
  def find(value)
    current = @head
    index = 0
    while current
      return index if current.value == value

      current = current.next_node
      index += 1
    end
    nil
  end

  # Converts the linked list to a string representation.
  # @return [String] a string representing the linked list.
  def to_s
    result = ''
    current = @head
    while current
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    result += 'nil'
    result
  end

  # Inserts a new node with the given value at the specified index.
  # @param value [Object] the value to insert.
  # @param index [Integer] the index to insert at.
  # @return [void]
  def insert_at(value, index)
    return prepend(value) if index.zero?

    previous = at(index - 1)
    return unless previous

    new_node = Node.new(value, previous.next_node)
    previous.next_node = new_node
  end

  # Removes the node at the specified index.
  # @param index [Integer] the index of the node to remove.
  # @return [void]
  def remove_at(index)
    return @head = @head.next_node if index.zero? && @head

    previous = at(index - 1)
    return unless previous&.next_node

    previous.next_node = previous.next_node.next_node
  end
end
