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

  def stock_to_hash(item)
    {
      :stock_id => item.id,
      :title => item.label,
      :description => item.description,
      :price => item.price,
      :image => item.photos.empty? ? 'mock/hidethepain.png' : item.photos.first.image.url
    }
  end
end
