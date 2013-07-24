require 'spec_helper'
module Bowling_Game_Algorithm
  describe Bowling_Algorithm do
    let(:output) { double('output').as_null_object }
    let(:algorithm)   { Bowling_Algorithm.new(output) }
    context "#start" do
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to the Bowling Game Algorithm!')
        algorithm.start
      end
      it "prompts for the first roll" do
        output.should_receive(:puts).with("Enter the number of pins fallen:")
        algorithm.start
      end
    end

    context "#all ones" do
      it "returns 20" do
        20.times do
          algorithm.roll('1')
        end
        1.times do
          algorithm.roll('0')
        end
        algorithm.score.should == 20
      end
    end

    context "#one spare" do
      it "returns 16" do
        2.times { algorithm.roll('5') }
        algorithm.roll('3')
        18.times { algorithm.roll('0') }
        algorithm.score.should == 16
      end
    end

    context "#one strike" do
      it "returns 24" do
        algorithm.roll('10')
        algorithm.roll('3')
        algorithm.roll('4')
        18.times { algorithm.roll('0') }
        algorithm.score.should == 24
      end
    end

    context "#all strikes" do
      it "returns 300" do
        12.times {algorithm.roll('10')}
        9.times {algorithm.roll('0')}
        algorithm.score.should == 300
      end
    end
  end
end
