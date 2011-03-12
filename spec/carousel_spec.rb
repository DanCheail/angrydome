require 'carousel'

describe Carousel do
  before(:each) do
    @carousel = Carousel.new(3, :a, :b, :c)
  end

  it "accepts a variable-length set of initial values for population" do
    Carousel.new(3, :a, :b, :c).should eql [:a, :b, :c]
  end

  it "throws an exeption when the number of slots is less than the number of initial values" do
    expect { Carousel.new(1, :a, :b) }.to raise_error
  end

  it "#next returns the current element and automatically shifts the pointer by one" do
    [:b, :c, :a, :b, :c, :a].each do |e|
      @carousel.next.should == e
    end
  end
  
  it "#push will automatically shift the first elements from the slots to ensure that the count is maintained" do
    @carousel.push(:d)
    @carousel.should == [:b, :c, :d]
  end
end