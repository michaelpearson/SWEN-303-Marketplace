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
