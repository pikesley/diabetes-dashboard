require 'spec_helper'
require 'diabetes_dashboard'

describe DiabetesDashboard do
  before :each do
    Timecop.freeze DateTime.parse '2014-01-13T08:00:00+00:00'
  end

  after :each do
    Timecop.return
  end

  VCR.use_cassette 'cassette' do
    it 'should return a list of points for the last 24 hours', :vcr do
      DiabetesDashboard.glucose(1).should == [
          { :x => 1389522120, :y => 7.9 },
          { :x => 1389534540, :y => 6.2 },
          { :x => 1389547260, :y => 3.7 },
          { :x => 1389557880, :y => 7.5 },
          { :x => 1389571020, :y => 7.5 },
          { :x => 1389598260, :y => 6.5 }
      ]
    end


    it 'should return an average for the last 24 hours', :vcr do
      DiabetesDashboard.glucose_average(1).should == 6.6
    end

    it 'should return an average for the last week', :vcr do
      DiabetesDashboard.glucose_average(7).should == 10.2
    end
  end
end
