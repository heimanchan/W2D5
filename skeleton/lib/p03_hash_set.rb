class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    
    unless self.include?(key)
      self[key] << key
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(key)
    if self.include?(key)
      @count -= 1
      self[key].delete(key) if self.include?(key)
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets] 
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
