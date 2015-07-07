require './tree'
require 'rspec'

RSpec.describe Tree do
  context 'initialize with hash' do
    before do
      @tree = Tree.new ({
        'grandpa' => {
          'dad' => {
            'child 1' => {},
            'child 2' => {}
          },
          'uncle' => {
            'child 3' => {},
            'child 4' => {}
          }
        }
      })
    end

    it 'save node_name' do
      expect(@tree.node_name).to eq('grandpa')
    end

    it { expect(@tree.childrens.first.node_name).to eq('dad') }
    it { expect(@tree.childrens.first.childrens.first.node_name).to eq('child 1') }
    it { expect(@tree.childrens.first.childrens[1].node_name).to eq('child 2') }
    it { expect(@tree.childrens[1].node_name).to eq('uncle') }
    it { expect(@tree.childrens[1].childrens.first.node_name).to eq('child 3') }
    it { expect(@tree.childrens[1].childrens[1].node_name).to eq('child 4') }

    it 'should visit 7 nodes' do
      count = 0
      @tree.visit_all { |tree| count+=1 }
      expect(count).to be(7)
    end
  end
end
