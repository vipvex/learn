arr = [1, 2, 3, 4]

arr.each do |a|
  puts a
end

def run_block
  puts "Before hello world!"
  yield if block_given?
end

run_block do
  puts "hello world"
end

class Array 
  def random_each(&b)
    p b
    shuffle.each do |a|
      b.call a
    end
  end
end

[1, 2, 3, 4, 5].random_each do |a|
  puts a * 5
end


def run_two_procs(a, b)
  a.call
  b.call
end

proc1 = Proc.new do 
  puts "This is proc1"
end

proc2 = Proc.new do 
  puts "This is proc2"
end

run_two_procs proc1, proc2

def run_block
  p = Proc.new # Looks to see if the scope was passed a block
  p.call
end

run_block do
  puts "Hello world"
end


my_proc = Proc.new do |a|
  puts "This is my proc #{a} was passed"
end

my_proc.call(10)
my_proc.(30)
my_proc[40]
my_proc === 50


yolo = proc do 
  puts ""
end

hello = proc do |a, b, c|
  puts "This is a proc"
end

hello.call

def run_a_proc(p)
  puts "Before"
  p.call
  puts "After"
end

def our_program
  run_a_proc proc { puts "I'm a proc"; return }
  run_a_proc lambda { puts "I'm a lambda"; return }

end

our_program

def run_proc(p)
  p.call
end

name = 'Fred'
print_a_name = proc { puts name }
run_proc print_a_name