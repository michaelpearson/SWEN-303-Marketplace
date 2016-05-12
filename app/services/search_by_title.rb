class SearchByTitle
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def call
    query_stock.map do |item|
      stock_to_hash(item)
    end
  end

  private

  def query_stock
    Stock.where("label like ?", "%#{query}%")
  end

  def stock_to_hash(item)
    {
      :stock_id => item.id,
      :title => item.label,
      :description => "404 description not found", #TODO include actual description, once implemented
      :price => item.price,
      :image => '/assets/images/mock/hidethepain.png' #TODO include actual image url
    }
  end
end