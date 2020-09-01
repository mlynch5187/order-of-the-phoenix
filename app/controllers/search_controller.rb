class SearchController < ApplicationController

  def index
    # conn = Faraday.new('https://www.potterapi.com/v1') do |f|
    #   f.params['key'] = '$2a$10$2klzYEw2EcBFCX6UW6actOfDX7p8laQc9R0S6XBcyIkyfA3WLmwXG'
    # end
    # response = Faraday.get('/characters') do |f|
    #   f.params['house'] = params['house']
    # end
    # members = JSON.parse(response.body, symbolize_names: true)
    @members = Member.house_members(params[:house])
  # end
end
