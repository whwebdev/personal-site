# # DBC Chicago Phase 0 Assessment

# EXERCISE 1

first_name = "adam"
last_name = "willis"


# EXERCISE 2

def calculate_product(int_array)
  int_array.inject(:*)
end

#My  TDD RSPEC Assert Code for exercise 2
def assert
  raise 'PROBLEM!!!!!!!!' unless yield
end
assert{ p (calculate_product([]) == nil) == true }
assert{ p (calculate_product([1,2,3]) == 6) == true }
assert{ p (calculate_product([0,-1,-10]) == 0) == true }
assert{ p (calculate_product([1,-1,-10]) == 10) == true }


# EXERCISE 3

def calculate_product_odd(int_array)
  int_array.delete_if{|x| x.even?}.inject(:*)
end

# My TDD RSPEC Assert Code for exercise 3
def assert
  raise 'PROBLEM!!!!!!!!' unless yield
end
assert{ p (calculate_product_odd([]) == nil) == true }
assert{ p (calculate_product_odd([0]) == nil) == true }
assert{ p (calculate_product_odd([1,2,3]) == 3) == true }
assert{ p (calculate_product_odd([0,-1,-10]) == -1) == true }
assert{ p (calculate_product_odd([1,2,3,4,5]) == 15) == true }



# EXERCISE 4

=begin

  def format_name(name)
    return "#{name[:last]}, #{name[:first]}"
  end

  def display_name(name)
    puts format_name(name)
  end

  The method #format_name takes a hash called name as an argument. The method
  returns a string consiting of pre-written text and interpolated hash calls
  that retrieve values from the hash. The values are found by using a :symbol
  that refers to a named key inside of the hash, and the value associated with
  that key is returned, just like you would retrieve a (value[i]) from an array
  by passing it the index number associated with the value you want the array
  to return. These retrieved string values are returned as part of the string
  in the place the interpolated calls.

  The method #display_name takes a hash called name as an argument. It contains
  a call to the above described method #format_name that accepts the incoming
  hash as an argument, preceded by a puts. When a value is returned from
  calling #format_name, it will be displayed on the console because of the puts.

  A setup such as this could be useful because you can use the #display_name
  method as a means of applying puts to the method #format_name. If you wish to
  still get the value returned from #format_name with a puts, you may call that
  method on it's own. The methods are named specifically for what they do, and
  perform the named action only. That's one tenet of DRY for ya!

=end




# EXERCISE 5

def find_missing_number(missing_number_list)
  (1..10000).reduce(:+) - missing_number_list.split(",").map(&:to_i).reduce(:+)
end

# My TDD RSPEC Assert Code for exercise 5
string_missing_7    = (1..10000).reject { |x| x == 7 }.join(", ")
string_missing_4567 = (1..10000).reject { |x| x == 4567 }.join(", ")
string_missing_9999 = (1..10000).reject { |x| x == 9999 }.join(", ")
def assert
  raise 'PROBLEM!!!!!!!!' unless yield
end
assert{ p (find_missing_number(string_missing_7) == 7) == true }
assert{ p (find_missing_number(string_missing_4567) == 4567) == true }
assert{ p (find_missing_number(string_missing_9999) == 9999) == true }


# EXERCISE 6

def valid_string?(string_to_test)

  brace_reference = {'[' => ']', '{' => '}', '(' => ')',']' => '[', '}' => '{', ')' => '('}
  test_array = []
  valid = false

  brace_array = string_to_test.gsub(/[^\[\{\(\)\}\]]/, '').split('')

  if brace_array.count.odd?
    false
  else
    brace_array.each{ |v|
      if v =~ /[\)\}\]]/
        test_array.last == brace_reference[v] ? test_array.pop : valid = false
      else
        test_array << v
      end
    }
    valid = true if test_array == []
  end
  valid
end

# My TDD RSPEC Assert Code for exercise 6
def assert
  raise 'PROBLEM!!!!!!!!' unless yield
end
assert{ p (valid_string?("[ ]") == true) == true }
assert{ p (valid_string?("[  ") == false) == true }
assert{ p (valid_string?("[ ( text ) {} ]") == true) == true }
assert{ p (valid_string?("[ ( text { ) } ]") == false) == true }


# EXERCISE 7

class House

  attr_reader :current_temp, :min_temp, :max_temp, :heater_on, :ac_on

  def initialize(current_temp, min_temp, max_temp)
    @current_temp = current_temp
    @min_temp = min_temp
    @max_temp = max_temp
    @heater_on = false
    @ac_on = false
  end

  def toggle_heater
    @ac_on = false if !@heater_on
    @heater_on ? @heater_on = false : @heater_on = true
  end

  def toggle_ac
    @heater_on = false if !@ac_on
    @ac_on ? @ac_on = false : @ac_on = true
  end

  def update_temp!
    toggle_ac unless @current_temp < @max_temp
    toggle_heater unless @current_temp > @min_temp
    @current_temp += 1 unless !@heater_on
    @current_temp -= 2 unless !@ac_on
  end

end

# My TDD RSPEC Assert Code for exercise 7
def assert
  raise 'PROBLEM!!!!!!!!' unless yield
end

my_house = House.new(67, 62, 70)

# Each house has its own current_temp (e.g. 67), Each house has its own
# minimum_temp and maximum_temp (e.g., 62 and 70, respectively).

assert{ p my_house.instance_variable_defined?(:@current_temp) == true }
assert{ p (my_house.current_temp == 67) == true }
assert{ p my_house.instance_variable_defined?(:@min_temp) == true }
assert{ p (my_house.min_temp == 62) == true }
assert{ p my_house.instance_variable_defined?(:@max_temp) == true }
assert{ p (my_house.max_temp == 70) == true }

# Each house has its own heater_on and ac_on status (true if on, false if off).
assert{ p my_house.instance_variable_defined?(:@heater_on) == true }
assert{ p my_house.instance_variable_defined?(:@ac_on) == true }

# The heater_on and ac_on properties are set to false when a
# house is instantiated.
assert{ p (my_house.heater_on == false) == true }
assert{ p (my_house.ac_on == false) == true }

# The House initialize method accepts three arguments:
# a current temp, a minimum temp, and a maximum temp.
assert{ p (House.instance_method(:initialize).arity == 3) == true }

# The House initialize method throws an ArgumentError if more or less than
# three arguments are passed.
assert{
  p (
    begin
      House.new(1)
      rescue Exception => e
      e.to_s == "wrong number of arguments (1 for 3)"
    end == true
    ) == true
}
assert{
  p (
    begin
      House.new(1,2,3,4)
      rescue Exception => e
      e.to_s == "wrong number of arguments (4 for 3)"
    end == true
    ) == true
}

# Calling toggle_heater on an instance of House turns the heater on/off.
appliance_check_house = House.new(67, 62, 70)
assert{ p (appliance_check_house.heater_on == false) == true }
assert{ p (appliance_check_house.toggle_heater == true) == true }
assert{ p (appliance_check_house.heater_on == true) == true }

# Calling toggle_ac turns the air conditioner on/off.
assert{ p (appliance_check_house.ac_on == false) == true }
assert{ p (appliance_check_house.toggle_ac == true) == true }
assert{ p (appliance_check_house.ac_on == true) == true }

# Only the heater or the air conditioner should be on at the
# same time, never both.
assert{ p ((appliance_check_house.ac_on == true && appliance_check_house.heater_on == true) == false) == true}

# Calling update_temp! increases or decreases the current temperature
# depending on if the heater or the air conditioner is on.
# When the heater is on, update_temp! increases thecurrent_temp by 1 unit.
# When the air conditioner is on, update_temp! decreases
# the current_temp by 2 units.

# (AC currently on)
assert{ p (appliance_check_house.current_temp) == 67 }
appliance_check_house.update_temp!
assert{ p (appliance_check_house.current_temp) == 65 }
assert{ p (appliance_check_house.toggle_heater == true) == true }
appliance_check_house.update_temp!
assert{ p (appliance_check_house.current_temp) == 66 }

# When the current_temp rises above the maximum_temp, the air conditioner
# turns on and the heater should be off.
maxtemp_check_house = House.new(69, 62, 70)
assert{ p (maxtemp_check_house.toggle_heater == true) == true }
assert{ p (maxtemp_check_house.current_temp == 69) == true }
maxtemp_check_house.update_temp!
assert{ p (maxtemp_check_house.current_temp == 70) == true }
maxtemp_check_house.update_temp!
assert{ p (maxtemp_check_house.current_temp == 68) == true }

# When the current_temp falls below the minimum_temp, the heater turns on
# and the air conditioner should be off.
mintemp_check_house = House.new(63, 62, 70)
assert{ p (mintemp_check_house.toggle_ac == true) == true }
assert{ p (mintemp_check_house.current_temp == 63) == true }
mintemp_check_house.update_temp!
assert{ p (mintemp_check_house.current_temp == 61) == true }
mintemp_check_house.update_temp!
assert{ p (mintemp_check_house.current_temp == 62) == true }




# EXERCISE 8

=begin

  Reverse Polish Notation Calculator

    ##Santikian's solution

    class RPNCalculator
      def evaluate(exp)
        operands = []
        pool = exp.split.map {|i| i =~ /-?\d+/ ? i.to_i : i.to_sym}
        pool.each {|i| i.is_a?(Fixnum) ? operands << i : operands << operands.pop(2).reduce(i)}
        operands[0]
      end
    end

    ## Wishne's solution

    class RPNCalculator
    def evaluate(expn)
      return evaluate1(expn).to_i
    end
    def evaluate1(expn)
      #Format the input string so that spaces are uniformly interspersed:
      expn = expn.split(" ").join(" ") + " "
      #Find the (first) inner operation in the string:
      inner_expn = expn.match(/(\-?\d*)\s(\-?\d*)\s([+\-\*])\s/)
      #Check for base case and validity of input string as RPN expression:
      if inner_expn == nil
        expn_arr = expn.split(" ")
        if expn_arr.length == 1
          return expn
        else
          puts "Invalid RPN expression."
        end
      else
        #Recursive step, wherein we evaluate the (first) inner operation:
        inner_calculation = inner_expn[1].to_i.public_send inner_expn[3], inner_expn[2].to_i
        simplified_expn = inner_expn.pre_match + inner_calculation.to_s + " " + inner_expn.post_match
        evaluate(simplified_expn)
      end
    end
  end

  I chose Santikian's solution initially because of it's succinctness. After
  reviewing his code, his was very similar to my most recent refactoring of this
  problem, which of course is what I felt was best at the time. I liked how he
  converted the operands to objects that he then passed to the reduce method in
  the block of his each statement. It straight and to the point and gets the
  problem done quickly assuming correct input. Good enough to pass the given
  RSPEC's for the challenge.

  But then looking at the other ones, I realized this problem was pretty much
  attacked in a similar fashion by everyone. More or less, everyones problem
  was handling it the same way, some just taking more steps along the same path.

  Then one stuck out to me, the one done by Wishne. His was the only one I
  noticed that actually had a catch in place in case of a number that could not
  be processed as an RPN number.

  So if we define "best solution" as one that will not "break" in the case of an
  error? In that case, Wishne's isn't just the best one, it's the only one.
  If we define "best solution" as a DRY program that quickly and succinctly
  accomplishes the given task at hand? Santankian's would be the best for that.

  Overall, I believe that a version like Santankians solution with an error
  catch in it would be the overall best solution.



  Reverse Words

    ##Ta's solution

    def reverse_words(str)
      str.split.map(&:reverse).join(' ')
    end


    I chose Ta's because his was the most succinct and to the point. It takes
    away an extra reverse method I was seeing in mine and everyone elses. It
    does exactly what I mentally envisioned going into this: splitting each
    word up, directly reversing the words and joining the string back together.
    .map was perfect for this.

    I tried messing with regex and rsub to see if there was a more succinct way
    but in the end I kept going back to his. The one I came up with was this:

    def reverse_words(str)
      str.gsub(/\S+/){|m| m.reverse}
    end

    But then I ran my code against his code in the ruby benchmark module.
    Mine took 6 seconds for 1000 iterations, where his only took 4 seconds.

    I went ahead an ran them all through benchmark and found that the fastest
    performing solution, taking 3.1 seconds was Vergel's solution:

   def reverse_words(str)
      str=str.split
      str=str.reverse
      str=str.join(" ")
      str=str.reverse
   end

   Interesting!!

   (Our cohort median was ~4.2 )

  Fibonacci Number

    ## Omoruyi's solution

    def is_fibonacci?(i, current = 1, before = 0)
      return true if current == i || i == 0
      return false if current > i
      is_fibonacci?(i, current + before, current)
    end

    For this one I chose Omoruyi's solution. I like his because I think it's
    the best in the context of being recursive. Looking at how how it works,
    it made so many things about how recursiveness works click in my head for
    me.... I could see this method "unfolding into itself"...until it reaches
    an apex and then returns the result all the way back from method to method
    to method until it reaches the original call. I can't think of writing
    a recursive method in any better way than this. He even named the variables
    in a way that makes sense in the context of Fibonacci numbers, current
    and before, so that when this starts unfolding into itself, it's perfectly
    riding a line of fibonaccis until it reaches the given number. it'll stop
    it at true if the given number is a fib, or stop it at false if it's greater
    than the current fib on the line. once it stops, it just returns the
    true or false back up the line, no further processing done on prupose or
    accident. I'd venture to say in my limited experience that this would be
    the "perfect" recursive answer for this problem? There is nothing I could
    think of changing about it.

=end
