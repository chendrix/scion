require 'thor'

module Scion
  class CLI < Thor

    desc 'roll DICE AUTO_SUCCESSES [NUM_SIDES] [THRESHOLD]', 'Roll number of DICE, adding a certain AUTO_SUCCESSES'
    def roll(dice, auto_successes, num_sides = 10, threshold = 7)
      die_rolls = (1..Integer(dice)).map { |_| Random.rand(Integer(num_sides)) + 1 }

      puts die_rolls.join(", ")

      successes = die_rolls.reduce(0) do |num_successes, die|
        case die
          when Integer(num_sides)
            num_successes + 2
          when -> (d) { d >= Integer(threshold) }
            num_successes + 1
          else
            num_successes
        end
      end + Integer(auto_successes)
      puts "Successes: #{successes}"
    end
  end
end
