require 'rspec'
require './acts_as_csv_module'

RSpec.describe RubyCsv do
  let (:ruby_csv) { ruby_csv = RubyCsv.new }

  it { expect(ruby_csv.headers).to eq(['one', 'two']) }
  it { expect(ruby_csv.csv_contents).to eq([['lions', 'tigers']]) }
end
