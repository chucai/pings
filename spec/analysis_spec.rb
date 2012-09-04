# -*- encoding: utf-8 -*- 
require 'spec_helper'
require File.join("./lib/analysis.rb")

describe "analysis" do
	ENV["RACK_ENV"] = 'analysis'

	it "parse" do
		Analysis.parse.should == {
			"19:24" => "210.433", 
			"19:35" => "57.091"
		}
	end

	it "get_avg_value" do
		line = "rtt min/avg/max/mdev = 151.061/210.433/238.102/26.461 ms\n"
		Analysis.get_avg_value(line).should == "210.433"
	end
end
