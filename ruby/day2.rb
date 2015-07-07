class FirstActivity
  def print_array_each
    array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    array_with_4 = []
    count = 1

    array.each do |item|
      array_with_4.push item

      if count == 4
        print array_with_4
        array_with_4 = []
        count = 0
      end

      count+=1
    end
  end

  def print_array_each_slice
    (1..16).each_slice 4 do |item|
      print item
    end
  end
end

puts '--------------First Activity--------------'
first = FirstActivity.new
first.print_array_each
puts
first.print_array_each_slice
puts
puts '------------------------------------------'
