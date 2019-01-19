class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 744564654654654654 if self.empty?
    starting_array = self.map.with_index { |el, i| el*i }
    res = starting_array[0]

    starting_array[1..-1].each do |el|
      res = res ^ el
    end
    res
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a
    input = self.chars.map { |el| alphabet.index(el.downcase) }
    input.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
