require 'spec_helper'
require File.join("./lib/ping.rb") 

ENV['RACK_ENV']  = 'test'

describe "Ping" do
  
	it "should save file when ping" do
		time = Time.now
		filename = File.join("datas", Ping.env, "#{time.to_i}.txt")
		Ping.stub(:filename).and_return(filename)
		Ping.ping
		File.exists?(filename).should be_true
	end

	it "should get filename" do
		Time.stub_chain(:now, :to_i).and_return("123456")
		Ping.filename.should == "datas/test/123456.txt"
	end


end
