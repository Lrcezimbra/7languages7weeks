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
      row = CsvRow.new @headers, @csv_contents
      block.call row
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

class CsvRow
  def initialize headers, contents
    @headers = headers
    @contents = contents
  end

  def method_missing name, *args
    column = name.to_s
    index = @headers.rindex column

    result = @contents.collect do |row|
      row[index]
    end

    result
  end
end
