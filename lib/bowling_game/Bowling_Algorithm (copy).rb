module Bowling_Game_Algorithm
  class Bowling_Algorithm
    def initialize(output)
      @output = output
      @frames = Array.new(21)
      @try = 0
    end

    def start
      @output.puts 'Welcome to the Bowling Game Algorithm!'
      @output.puts 'Enter the number of pins fallen:'
    end

    def roll(pins)
      @frames[@try] = pins.to_i
      @try += 1
    end

    def score
      score = 0
      frame = 0
      try = 0
      while frame < 10
        if is_Spare?(frame)
          score += 10 + @frames[frame + 2]
          try += 2
        elsif is_Strike?(frame)
          score += 10 + next_two_balls(frame)
          try += 1
        else
          score += two_balls_in_frame(try)
          try += 2
        end
        frame += 1
      end
      return score
    end

    def is_Spare?(current_frame)
      if current_frame + 1 < 21
        if @frames[current_frame] + @frames[current_frame + 1] == 10
          return true
        else
          return false
        end
      else
        return false
      end 
    end

    def is_Strike?(current_frame)
      if @frames[current_frame] == 10
        return true
      else
        return false
      end
    end

    def next_two_balls(current_frame)
      if current_frame < 20
       return @frames[current_frame + 1] + @frames[current_frame + 2]
      else
        return 0
      end
    end

    def two_balls_in_frame(frame)
      return @frames[frame] + @frames[frame + 1]
    end
  end
end
