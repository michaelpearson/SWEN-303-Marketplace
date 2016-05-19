require_relative('../../app/services/search_by_title')

class SearchController < ApplicationController
  def index
    @search_query = params[:query]
    @search_category = params[:category]

    @results = SearchByTitle.new(@search_query, @search_category).call
  end
end
