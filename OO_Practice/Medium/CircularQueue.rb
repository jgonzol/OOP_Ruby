# a circular queue is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added,
# it is added to the position that immediately follows the most recently added object, while removing an object always removes an object that has been in the queue the longest. 
# This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the queue requires getting rid of an existing object;
# with a circular queue, that object that has been in the queue the longest is discarded and replaced by the new object. 
# write a circular queue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with with an argument passed in during initialization
# it should also provide the following methods: enqueue to add an object, and dequeue to remove and return the oldest object in the queue. it should return nil if it is empty


class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@next_position)
    end

    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    value = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    value
  end

  private

  def increment(position)
    (position + 1) % @buffer.size
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil