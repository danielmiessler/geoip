require 'rubygems'
require 'hpricot'
require 'open-uri'

file = File.open('/Users/daniel/Development/newfile', 'w')

File.open('/Users/daniel/Development/ips').each { |line|
  doc = Hpricot(open("http://ipinfodb.com/ip_query.php?ip=#{line}"))
  (doc/'response').each do|el|
    
    ip = (el/'ip').inner_html
    country = (el/'countryname').inner_html
    state = (el/'regionname').inner_html
    city = (el/'city').inner_html
    puts "#{ip},#{country},#{state},#{city}"
    file.puts "#{ip},#{country},#{state},#{city}"
    file.flush
  end
  
}
