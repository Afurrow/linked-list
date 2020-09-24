class LinkdedList

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @tail
      @tail.next_node = node
    else
      @head = node
    end

    @tail = node
    @size += 1
    puts "#{node.to_s} sucessfully appended"
  end

  def prepend(value)
    node = Node.new(value, @head)
    @head = node
    @size +=1
    puts "#{node.to_s} sucessfully prepended"    
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return "No node at this index" if index > @size || index < 0

    node = @head
    index.times do
      node = node.next_node
    end
    node
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
    node = @head
    str = ""
    @size.times do
      if node.next_node
        str << node.to_s + " -> " 
      else 
        str << node.to_s
      end

      node = node.next_node
    end
    puts str
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
    "( #{@value} )"
  end
end

ll = LinkdedList.new
ll.append("Gurl")
ll.append("What")
ll.append("The")
ll.append("Ballz")
# puts ll.size()
# puts ll.head()
# puts ll.tail()
# puts ll.at(2)
# ll.to_s()
# ll.pop()
# ll.to_s()
# p ll.contains?("What")
# p ll.find("What")