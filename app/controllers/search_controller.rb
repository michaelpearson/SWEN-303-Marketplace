class SearchController < ApplicationController
  def index
    @search_query = params[:query]
    @results = [{
        :stock_id => 1,
        :title => 'Some item',
        :description => 'Some item description which will give a short description',
        :price => 100,
        :image => '/assets/images/mock/hidethepain.png'
                }]

  end
end
