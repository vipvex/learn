class SimonPlayer 
  attr_accessor :name, :move
   
  def initialize(name, move)
    @name = name
    @move = move
  end 
  
  def new_move(data)
    @move = data[:move]
    puts "#{@name}'s move is #{@move}!"
  end
    
end

class DumbSimonPlayer 
  attr_accessor :name, :move
   
  def initialize(name, move)
    @name = name
    @move = move
  end 
  
  def new_move(data)
    @move = data[:move]
    puts "#{@name}'s doesn't get the move #{@move} because he doesn't speak english!"
  end
    
end

EventBus.subscribe(SimonPlayer.new('Alex', 'no move'))
EventBus.subscribe(SimonPlayer.new('Steve', 'no move'))
EventBus.subscribe(SimonPlayer.new('Bob', 'no move'))
EventBus.subscribe(DumbSimonPlayer.new('Jose', 'no move'))

EventBus.publish(:new_move, move: 'Tap your head')
EventBus.publish(:new_move, move: 'Jump on one leg')
EventBus.publish(:new_move, move: 'Do the plank')



@players = 0
@enemies = 0

EventBus.subscribe(:add_players) do |payload|
  @players += payload[:amount]
  puts "Players: #{@players}"
end

@players = 0

EventBus.subscribe(:add_players) do |payload|
  @enemies += payload[:amount] * 2
  puts "Enemies: #{@enemies}"
end

EventBus.subscribe(:success) do |payload|
  puts "Success message: #{payload[:message]}"
end

EventBus.publish(:add_players, amount: 2)


EventBus.publish(:success, message: "2 + 2 = 4!")















class MyEventBus
  
  def initialize()
    @events = {}  
  end
  
  def subscribe(event_name, callback)
    @events[event_name] = callback
  end
  
  def emit(event_name, data)
    return false if @events[event_name].nil?
    
    @events[event_name].call(data)
  end
  
end

eventbus = MyEventBus.new

error_callback = Proc.new { |data| puts "Error 1. #{data[:message]}" }
error_callback_2 = Proc.new { |data| puts "Error 2. #{data[:message]}" }
success_callback = Proc.new { |data| puts "SUCCESS! #{data[:message]}" }


eventbus.emit('error', message: 'First error')  

eventbus.subscribe('error', error_callback) 
eventbus.emit('error', message: 'second error')  

eventbus.subscribe('error', error_callback_2) 
eventbus.emit('error', message: 'Yet another error')  

eventbus.subscribe('error', success_callback) 
eventbus.emit('success', message: 'wooo!')  
















class NewEventBus
  
  def initialize()
    @events = {}
  end
  
  def subscribe(event_name, callback)
    @events[event_name] = callback
  end
  
  def emit(event_name, data)
    return false if event_name.nil? || @events[event_name].nil?
    
    @events[event_name].call(data)  
  end
  
end

bus = NewEventBus.new

error_callback_1 = Proc.new { |data| puts "Error 1. #{data[:message]}" }
error_callback_2 = Proc.new { |data| puts "Error 2. #{data[:message]}" }
success_callback = Proc.new { |data| puts "Success!. #{data[:message]}" }


bus.emit("error", message: "First error")

bus.subscribe("error", error_callback_2)
bus.emit("error", message: "Second error")

bus.subscribe("error", error_callback_2)
bus.emit("error", message: "Yet another error")

bus.subscribe("success", success_callback)
bus.emit("success", message: "Woot woot!")