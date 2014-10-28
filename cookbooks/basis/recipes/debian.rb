if platform_family?("debian")
	package "iftop" do
		action :install
	end
elsif platform_family?("windows")
	puts "Windows platform"
end