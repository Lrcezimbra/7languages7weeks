class ReadFile
  def read
    regex = /neque eget iaculis tincidunt/
    file = File.new('day2_file.txt')
    file.each do |line|
      puts "Line #{file.lineno}: #{line}" if line[regex]
    end
  end
end

read_file = ReadFile.new
read_file.read
