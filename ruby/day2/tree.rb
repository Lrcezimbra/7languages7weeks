class Tree 
  attr_accessor :childrens, :node_name

  def initialize hash
    @childrens = []
    @node_name = hash.keys[0]
    hash[@node_name].each do |key, value|
      @childrens.push(Tree.new({ key => value }))
    end
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    childrens.each { |c| c.visit_all &block }
  end
end
