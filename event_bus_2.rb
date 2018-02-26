class EventBus
  def initialize
    @events = {}
  end
  
  def emit(event_name, data)
    @events[event_name].each do |event| 
      event.call(data)
    end
  end

  def subscribe(event_name, callback)
    @events[event_name] ||= []
    @events[event_name].push callback
  end
end

#----------------------------------------

eventbus = EventBus.new

error_callback = proc do |param| 
  puts "Error 1. #{param[:message]}" 
end

error_callback2 = proc do |param| 
  puts "Error 2. #{param[:message]}" 
end

success_callback = proc do |param| 
  puts "SUCCESS! #{param[:message]}" 
end

eventbus.subscribe "error", error_callback
eventbus.emit "error", { message: "Error one." }

eventbus.subscribe "error", error_callback2
eventbus.emit "error", { message: "Second error." }

eventbus.subscribe "error", error_callback2
eventbus.emit "error", { message: "Yet another error." }

eventbus.subscribe "success", success_callback
eventbus.emit "success", { message: "Great success!" }
 