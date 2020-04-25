class Stack
    attr_reader :underlying_array
    
  def initialize
    @underlying_array = []
  end

  def push(el)
    underlying_array.push(el)
    el
  end

  def pop
    underlying_array.pop
  end

  def peek
    underlying_array.last
  end

end

# a = Stack.new
# a.push(1)
# a.push(2)
# p a.peek
# p a
# a.pop
# p a
# p a.peek

class Queue
  
def initialize
    @underlying_array = []
  end

  def enqueue(el)
    underlying_array.push(el)
    el
  end

  def dequeue
    underlying_array.shift
  end

  def peek
    underlying_array.first
  end

  private

  attr_reader :underlying_array
  
end


# a = Queue.new
# a.enqueue(1)
# a.enqueue(2)
# p a.peek
# p a
# a.dequeue
# p a
# p a.peek

class Map
    attr_reader :underlying
    def initialize
        @underlying = []
    end

    def set(key,value)
        idx = underlying.index {|pair| pair[0] == key}
        if idx
            underlying[idx][1] = value
        else
            underlying.push([key,value])
        end
        value
    end

    def get(key)
        idx = underlying.index {|pair| pair[0] == key}
        if idx
            return underlying[idx][1]
        else
            return nil
        end
    end

    def delete(key)
        idx = underlying.index {|pair| pair[0] == key}
        underlying.delete_at(idx) if !idx.nil?
    end

    def show
        deep_dup(underlying)
    end
    
    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end

end

# a = Map.new
# a.set("a",5)
# p a
# a.set("b",4)
# a.set("a",1)
# p a
# p a.get("b")
# a.delete("a")
# p a
# p a.show