require 'csv'

%w(training test).each do |fn|
  File.open("data/#{fn}_filev1.csv", 'r') do |ifile|
    File.open("data/#{fn}.clean.csv", 'wb') do |ofile|
      i = 0
      until ifile.eof?
        print i += 1
        line = ifile.gets
        ofile.puts line.gsub(/"\$([0-9.,]+)"/) { $1.gsub(/,/, '') }
      end
    end
  end
end
