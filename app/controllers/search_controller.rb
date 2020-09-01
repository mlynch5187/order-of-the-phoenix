class SearchController < ApplicationController

  def index
    @members = Member.house_members(params[:house])
  end
end
