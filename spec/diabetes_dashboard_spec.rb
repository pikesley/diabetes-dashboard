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
    context 'glucose' do
      it 'should return a list of readings for the last 24 hours', :vcr do
        DiabetesDashboard.points('glucose', 1).should == [
            { :x => 1389522120, :y => 7.9 },
            { :x => 1389534540, :y => 6.2 },
            { :x => 1389547260, :y => 3.7 },
            { :x => 1389557880, :y => 7.5 },
            { :x => 1389571020, :y => 7.5 },
            { :x => 1389598260, :y => 6.5 }
        ]
      end


      it 'should return an average for the last 24 hours', :vcr do
        DiabetesDashboard.average('glucose', 1).should == 6.6
      end

      it 'should return an average for the last week', :vcr do
        DiabetesDashboard.average('glucose', 7).should == 10.2
      end
    end

    context 'humalog' do
      it 'should return a list of doses for the last 24 hours', :vcr do
        DiabetesDashboard.points('humalog', 1).should == [
            { :x => 1389522240, :y => 4.5 },
            { :x => 1389534720, :y => 6.0 },
            { :x => 1389558780, :y => 8.0 },
            { :x => 1389598740, :y => 5.0 }
        ]
      end
      it 'should return a list of doses for the last week', :vcr do
        DiabetesDashboard.points('humalog', 7).should == [
            { :x => 1389013680, :y => 7.5 },
            { :x => 1389037860, :y => 8.0 },
            { :x => 1389079680, :y => 4.0 },
            { :x => 1389097620, :y => 6.0 },
            { :x => 1389118020, :y => 8.0 },
            { :x => 1389166860, :y => 4.0 },
            { :x => 1389184200, :y => 7.0 },
            { :x => 1389211080, :y => 8.0 },
            { :x => 1389252840, :y => 4.5 },
            { :x => 1389270540, :y => 7.0 },
            { :x => 1389296580, :y => 8.5 },
            { :x => 1389339600, :y => 5.0 },
            { :x => 1389357120, :y => 7.0 },
            { :x => 1389391800, :y => 7.5 },
            { :x => 1389449460, :y => 6.0 },
            { :x => 1389470280, :y => 7.5 },
            { :x => 1389522240, :y => 4.5 },
            { :x => 1389534720, :y => 6.0 },
            { :x => 1389558780, :y => 8.0 },
            { :x => 1389598740, :y => 5.0 }
        ]
      end
    end
  end
end
