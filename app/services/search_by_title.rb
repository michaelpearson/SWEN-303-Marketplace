class SearchByTitle
  attr_reader :query, :category

  def initialize(query, category = "")
    @query = query
    @category = category
  end

  def call
    valid_stock.map do |item|
      stock_to_hash(item)
    end
  end

  private

  def query_stock
    Stock.where("label ilike ?", "%#{query}%")
  end

  def valid_stock
    query_stock.reject(&:met_required_bids?).select do |x|
      x.category.include? category
    end
  end

  def stock_to_hash(item)
    {
      :stock_id => item.id,
      :title => item.label,
      :description => item.description,
      :price => item.price,
      :image => item.photos.empty? ? 'mock/hidethepain.png' : item.photos.first.image.url(:thumb)
    }
  end
end
