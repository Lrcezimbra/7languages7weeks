module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each(&block)
      block.call CsvRow.new @headers, @csv_contents
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end

  class CsvRow
    def initialize headers, contents
      @headers = headers
      @contents = contents
    end

    def method_missing name, *args
      index = @headers.rindex name.to_s
      result = @contents.collect { |row| row[index] }

      result
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end
#
#csv = RubyCsv.new
#puts csv.each { |row| row.one }
#puts csv.each { |row| row.two }
