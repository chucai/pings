# -*- encoding: utf-8 -*- 
#


class Ping

	class << self

		def ping
			result = `ping -c 3 #{server} 1>#{filename}`
		end

		#def write_file
		#	File.open(filename, "w") do |file|
		#		file.write ping
		#	end
		#end

		def filename
			time = Time.now.to_i
			#filename = "#{time}.txt"
			filename = File.join("datas", env, "#{time}.txt")
		end

		def env
      ENV['RACK_ENV'] || 'origin'
		end

		def server
			"imsg.cn"
		end

	end

end
