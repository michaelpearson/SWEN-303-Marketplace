module SearchHelper
  def search_query_text(search_query, search_category, results)
    query_text = search_query.present? ? " for '#{search_query}'" : ""
    category_text = search_category.present? ? " in #{search_category}" : ""
    "#{results.count} results found#{query_text}#{category_text}"
  end
end
