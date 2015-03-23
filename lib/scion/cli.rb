require 'thor'

module Scion
  class CLI < Thor
    desc 'roll DICE [AUTO_SUCCESSES] [NUM_SIDES] [THRESHOLD]', 'Roll number of DICE, adding a certain AUTO_SUCCESSES'
    def roll(dice, auto_successes = 0, num_sides = 10, threshold = 7)
      dice = Integer(dice)
      auto_successes = Integer(auto_successes)
      num_sides = Integer(num_sides)
      threshold = Integer(threshold)

      die_rolls = (1..dice).map { |_| Random.rand(num_sides) + 1 }

      puts die_rolls.join(', ')

      critical_hit = -> (d) { d == num_sides }
      hit = -> (d) { d >= threshold }

      successful_die = die_rolls.reduce(0) do |num_successes, die|
        case die
          when critical_hit
            num_successes + 2
          when hit
            num_successes + 1
          else
            num_successes
        end
      end

      successes = successful_die + auto_successes
      puts "Successes: #{successes}"
    end
  end
end
