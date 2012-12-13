class SearchController < ApplicationController
  def site_search
    if params["search"]
      @search = params["search"]
      @search_results = PgSearch.multisearch(@search)

      @events = []
      @search_results.select{|p| p.searchable_type == "Event"}.each do |event|
        @events.push(Event.find(event.searchable_id))
      end

      @result_qty = @events.count
      render 'events/index'
    else
      redirect_to events_path
    end
  end
end


