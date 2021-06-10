require_relative 'linked_list'

my_ll = LinkedList.new
my_ll.append(1)
my_ll.append(2)
my_ll.prepend(3)
my_ll.prepend(4)
puts "size: #{my_ll.size()}"
puts my_ll.at(3)
puts my_ll.pop()
puts my_ll.at(2)
puts my_ll.contains?(1)
puts my_ll.contains?(7)
puts my_ll.find(1)
puts my_ll.find(7)
puts my_ll.to_s
puts my_ll.insert_at(5,2)
puts my_ll.to_s
puts my_ll.remove_at(1)
puts my_ll.to_s