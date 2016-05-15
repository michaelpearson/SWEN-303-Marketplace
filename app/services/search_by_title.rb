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
    Stock.where("label ilike ?", "%#{query}%").reject(&:met_required_bids?)
  end

  def stock_to_hash(stock)
    {
      :stock_id => stock.id,
      :title => stock.label,
      :description => stock.description,
      :price => stock.price,
      :image => stock.primary_image_url
    }
  end
end
