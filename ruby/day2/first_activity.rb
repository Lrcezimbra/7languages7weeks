class FirstActivity
  def array_with_each
    array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    array_with_4 = []
    count = 1
    result = []

    array.each do |item|
      array_with_4.push item

      if count == 4
        result.push array_with_4
        array_with_4 = []
        count = 0
      end

      count+=1
    end

    result
  end

  def array_with_each_slice
    result = []

    (1..16).each_slice 4 do |items|
      result.push items
    end

    result
  end
end
