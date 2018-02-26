require 'car'
require 'shared_examples/a_standard_vehicle'

describe Car do
    
  it_behaves_like('a standard vehicle')
        
  it "allows for reading and writing of :doors" do
    subject.doors = 1
    expect(subject.doors).to eq(1)
  end
        
  describe "#initialize" do
    
    it "defaults to 4 doors" do
      expect(subject.doors).to eq(4)
    end
    
    it "allows setting a new number of doors" do
      car = Car.new(doors: 2)
      expect(car.doors).to eq(2)
    end
    
    it "defaults to 4 if door option is neither 2 or 4" do
      door_counts = []
      [0,1,3,5,6].each do |n|
        car = Car.new(doors: n)
        door_counts << car.doors
      end
      expect(door_counts).to all( eq(4) )
    end
    
  end
        
  describe '.colors' do
    
    it "returns an array of color names" do
      c = ['blue', 'black', 'red', 'green']
      expect(Car.colors).to match_array(c)
    end
    
  end
    
  describe '#full_name' do 
    
    it "returns a string in the expected format" do
    
      @toyota = Car.new(:make => 'Toyota', :year => 2009, :color => 'black')
      expect(@toyota.full_name).to eq('2009 Toyota (black)')
    
    end
    
    context "when initialized with no arguments" do
      
      it 'returns a string using default values' do
        car = Car.new
        expect(car.full_name).to eq('2007 Volvo (unknown)')
      end
      
    end
    
    
  end
  
  describe '#coupe?' do
    it 'returns true if it has 2 doors' do
      car = Car.new(doors: 2)
      expect(car.coupe?).to be true
    end
    
    it 'returns true if it does not have 2 doors' do
      car = Car.new(doors: 4)
      expect(car.coupe?).to be false
    end
  end
  
  
  describe '#sedan?' do
    it 'returns true if it has 4 doors' do
      car = Car.new(doors: 4)
      expect(car.sedan?).to be true
    end
    
    it 'returns true if it does not have 4 doors' do
      car = Car.new(doors: 2)
      expect(car.sedan?).to be false
    end
  end
    
end