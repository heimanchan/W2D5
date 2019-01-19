require 'byebug'

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  # def my_each(&prc)
  #   curr = @head

  # end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end


  def first()
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail || @tail.prev == @head
  end

  def get(key)
  end

  def include?(key)
    curr_node = @head
    until curr_node == @tail
      # debugger
      return true if curr_node.key == key
      curr_node = curr_node.next
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    before_tail = @tail.prev
    before_tail.next = new_node
    new_node.prev = before_tail
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
