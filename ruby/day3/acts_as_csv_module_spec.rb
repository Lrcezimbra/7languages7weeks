require 'rspec'
require './acts_as_csv_module'

RSpec.describe RubyCsv do
  let (:csv) { RubyCsv.new }

  it { expect(csv.headers).to eq(['one', 'two']) }
  it { expect(csv.csv_contents).to eq([['lions', 'tigers']]) }
  it { expect(csv.each { |row| row.one } ).to eq(['lions']) }
  it { expect(csv.each { |row| row.two } ).to eq(['tigers']) }
end
