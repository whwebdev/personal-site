#!/usr/bin/env ruby
require 'benchmark'

10.times{
  Benchmark.bm do|b|
    b.report("recursive ") do
      a = ""
      1_000_000.times {
  def recurse_me_simple(times)
    if times == 0
      #puts "we hit the base case! times = 0!"
    else
      #puts "before calling recurse_me_simple.  times=#{times}"
      recurse_me_simple(times-1)
    end
  end

  recurse_me_simple(100)
      }
    end

    b.report("recursive ") do
      a = ""
      1_000_000.times {
  def iterate_me_simple(times)
    times.times{
      if times == 0
        #puts "we hit the base case! times = 0!"
      else
        #puts "before calling recurse_me_simple.  times=#{times}"
        times -= 1
      end
    }
  end

  iterate_me_simple(100)
      }
    end
  end
}
