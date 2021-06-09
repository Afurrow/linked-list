require_relative 'linked_list'

my_ll = LinkedList.new
my_ll.append('app_1')
my_ll.append('app_2')
my_ll.prepend('pre_1')
my_ll.prepend('pre_2')
puts "size: #{my_ll.size()}"
puts my_ll.at(0)