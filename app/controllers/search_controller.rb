require_relative('../../app/services/search_by_title')

class SearchController < ApplicationController
  def index
    @search_query = params[:query]
    @results = SearchByTitle.new(@search_query).call
  end
end
