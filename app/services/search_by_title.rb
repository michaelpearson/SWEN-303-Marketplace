class SearchByTitle
  attr_reader :query, :category

  def initialize(query, category = "")
    @query = query
    @category = category != "All" ? category : ""
  end

  def call
    valid_stock
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
end
