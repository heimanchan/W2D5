require 'byebug'

class MaxIntSet
  def initialize(max)
    @store = Array.new(max){false}
  end

  def idx(num)
    num % @store.length
  end

  def insert(num)
    validate!(num)
    if self.include?(num)
      return
    else
      @store[idx(num)] = true
    end
  end

  def remove(num)
    validate!(num)
    @store[idx(num)] = false if self.include?(num)
  end

  def include?(num)
    validate!(num)
    @store[idx(num)]
  end

  private

  def is_valid?(num)
    (num <= @store.length - 1) && (num >= 0) 
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self.include?(num)
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self.include?(num)
      self[num] << num
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(num)
    if self.include?(num)
      @count -= 1
      self[num].delete(num) if self.include?(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev_store = @store
    @store = Array.new(num_buckets*2) { Array.new }

    prev_store.each do |bucket|
      bucket.each do |el|
        @store[el % num_buckets] << el
      end
    end
    @store
  end
end
