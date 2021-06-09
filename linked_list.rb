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
    
    "Value at #{index}: #{node.to_s}"
  end

  def pop
    node = @head
    @size-2.times { node = node.next_node }
    puts "Popped #{node.next_node.to_s}"
    node.next_node = nil
    @tail = node
    @size -= 1
  end

  def contains?(value)
    index = 0
    node = @head
    @size.times do 
      return true if value == node.value 
      index +=1
      node = node.next_node
    end
    return false
  end

  def find(value)
    index = 0
    node = @head
    @size.times do 
      return index if value == node.value 
      index +=1
      node = node.next_node
    end
    return nil
  end

  def to_s
    current_node = @head
    until current_node.nil?
      current_node = current_node.next_node
    end
  end

  def insert_at(value, index)
  end

  def remove_at(index)
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