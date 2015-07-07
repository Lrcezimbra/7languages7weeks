require './first_activity'
require 'rspec'

RSpec.describe FirstActivity do
  before { @firstActivity = FirstActivity.new }

  it 'Using each, print the contents of an array of sixteen numbers, four numbers at a time.' do
    expect(@firstActivity.array_with_each).to eq([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]])
  end

  it 'Using each_slice, print the contents of an array of sixteen numbers, four numbers at a time.' do
    expect(@firstActivity.array_with_each_slice).to eq([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]])
  end
end
