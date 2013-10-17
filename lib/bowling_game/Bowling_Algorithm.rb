module Bowling_Game_Algorithm
  class Bowling_Algorithm
    SCORE_TEN = 10
    TOTAL_FRAMES = 21
    def initialize(output)
      @output = output
      @frames = Array.new(TOTAL_FRAMES)
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
      try = 0
      for frame in 0..9 do
        if is_spare?(frame)
          score += SCORE_TEN + @frames[frame + 2]
          try += 2
        elsif is_strike?(frame)
          score += SCORE_TEN + next_two_balls(frame)
          try += 1
        else
          score += two_balls_in_frame(try)
          try += 2
        end
      end
      return score
    end

    def is_spare?(current_frame)
      return ((current_frame + 1 < TOTAL_FRAMES) and (@frames[current_frame] + @frames[current_frame + 1] == SCORE_TEN))
    end

    def is_strike?(current_frame)
      return @frames[current_frame] == SCORE_TEN
    end

    def next_two_balls(current_frame)
      if current_frame < (TOTAL_FRAMES - 1)
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
