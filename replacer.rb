#!/usr/bin/ruby

filename="greatest_wrdp2.sql"

text = File.read(filename)
new_arr = []
text.each_line do |line|
  if line.include? "From ZAR"
    new_value = sprintf "%.2f",line.split("ZAR",2)[1].tr(',','').to_i*0.075
    puts new_value
    new_string = "$" + new_value.to_s + " USD"
    new_line = line.gsub(/(ZAR [0-9]*?,?[0-9]+.[0-9]+) pp/,new_string)
    new_arr.push(new_line)
  else new_arr.push(line)
  end
end

File.open("test4.txt", "w+") do |f|
  new_arr.each{ |element| f.puts(element) }
end
