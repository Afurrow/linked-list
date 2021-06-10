class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    @head ||= node 
    if @tail
      @tail.next_node = node
    else
      @tail = node
    end
    @tail = node
    puts "#{node.to_s} sucessfully appended"
  end

  def prepend(value)
    node = Node.new(value, @head)
    @head = node
    puts "#{node.to_s} sucessfully prepended"    
  end

  def size
    count = 0
    node = @head

    until node.nil? 
      count += 1
      node = node.next_node
    end

    count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    size = size()
    return "No node at this index" if index > size || index < 0

    node = @head
    index.times do
      node = node.next_node
    end
    
    node
  end

  def pop
    size = size()
    previous_tail = @tail
    return nil if size == 1
    node = @head
    node = node.next_node until node.next_node == @tail
    node.next_node = nil
    @tail = node
    
    "Popped: #{previous_tail.to_s}"
  end

  def contains?(value)
    node = @head
    until node.nil? do
      return true if value == node.to_s
      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head 
    index = 0
    until node.nil? do 
      return index if value == node.to_s
      index += 1
      node = node.next_node
    end
    nil
  end

  def to_s
    node = @head
    string = ''
    until node.nil?
      string += "( #{node.to_s} ) -> "
      node = node.next_node
    end
    string += 'nil'
    string
  end

  def insert_at(value, index)
    return puts 'Error: you selected an index outside of the list.' if index > size

    if index.zero?
      prepend(value)
    else
      new_node = Node.new(value, at(index))
      prev_node = at(index - 1)
      prev_node.next_node = new_node
      @tail = new_node if new_node.next_node.nil?
    end
  end

  def remove_at(index)
    return puts 'Error: you selected an index outside of the list.' if index > size

    if index.zero?
      @head = at(1)
    elsif at(index) == @tail
      @tail = at(index - 1)
      @tail.next_node = nil
    else
      prev_node = at(index - 1)
      prev_node.next_node = at(index + 1)
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    @value
  end
end