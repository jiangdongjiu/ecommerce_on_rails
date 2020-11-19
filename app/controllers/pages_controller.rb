class PagesController < ApplicationController
  def show_page
    @page = Page.find_by(permalink: params[:permalink])
  end
end
