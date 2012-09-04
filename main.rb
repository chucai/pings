# -*- encoding: utf-8 -*- 
require File.join("./lib/ping.rb")

i = 1
puts "ping 第 #{i} 次... ..."
Ping.ping
i = i + 1

while sleep(5) do
	puts "ping 第 #{i} 次... ..."
 	Ping.ping
	i = i + 1
end

