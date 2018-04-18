class SearchController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'search_layout'
end
