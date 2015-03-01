#!/usr/bin/ruby
require 'open-uri'
require 'digest/md5'

regex = /((http|https):\/\/\d+.media.tumblr.com\/[^\/]+\/tumblr_(.*).(jpg|png|gif))/
page_num = 1
count = 1
max = 9000
# sleep_t = 3
done = false

# make cli arg
if ARGV.size == 1 then
	user = ARGV[0]
	basedir = Dir.pwd # default saves to current dir
	puts "[!] no save directory found, using current location"
	sleep 3
elsif ARGV.size == 2 then
	user = ARGV[0]
	basedir = ARGV[1]
elsif ARGV.size == 3 then
	user = ARGV[0]
	basedir = ARGV[1]
	max = ARGV[2].to_i
elsif ARGV.size == 3 then
	user = ARGV[0]
	basedir = ARGV[1]
	max = ARGV[2].to_i

else
	puts "usage: ruby tumblr_scraper.rb 'username' '/path/to/save/' 'just take X photos'"
	exit
end

while not done do
	arr = Array.new
	puts "[*] scraping page #{page_num}"
	page = open('http://'+user+'.tumblr.com/page/'+page_num.to_s) do |p|
		p.each_line do |line|
			arr.push($&) if line =~ regex
		end
	end

	done = true if arr.size == 0

	arr.each do |pic|
		pic = pic.chomp('">')
		f = File.new("#{basedir}#{Digest::MD5.hexdigest(pic)}.#{pic.scan(/(jpg|png|gif)/)[0][0]}", "wb") 
		f.write(open(pic).read)
		f.close
		puts "[+] wrote pic #{count}"
		count += 1
		exit if count == max
		# sleep rand(sleep_t)
	end
	page_num += 1
end
