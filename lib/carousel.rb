class Carousel < Array
  def initialize(slots = 10, *initial_values)
    @slots = slots
    @index = 0

    if initial_values.length > @slots
      raise "Intial Values cannot be longer than the number of slots"
    end
    
    super(initial_values)
  end
  
  def next
    @index = @index.next % length
    at(@index)
  end
  
  def push(*elements)
    super
    
    if length > @slots
      shift(length - @slots)
    end    
  end
end