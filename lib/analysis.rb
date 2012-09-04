# -*- encoding: utf-8 -*- 

class Analysis

	class << self
		
		def parse 
			env = ENV['RACK_ENV'] || 'origin'
			result = {}
			dir = File.expand_path("../../datas/#{env}", __FILE__)
			puts dir
			Dir.glob(File.join(dir, "*.txt")) do |file|
				time_int = File.basename(file, ",txt")   
				date = Time.at(time_int.to_i)
				line = IO.readlines(file)[-1]
				result[date.strftime("%H:%M")] = get_avg_value(line)
			end
			result
		end

		def get_avg_value(line)
			match = (/(\d+.\d+)\/(\d+.\d+)/).match(line)
			match.nil? ? '0' : match[2]
		end

	end


end


if __FILE__ == $0
	result = Analysis.parse
	File.open("result.txt", "w") do |f|
		x = result.keys.join(",")
		y = result.values.join(",")
		f.write "x: \n" + x  + "\n y:" + y
	end
end
