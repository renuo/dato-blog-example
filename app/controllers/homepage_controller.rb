class HomepageController < ApplicationController
  include DatoQueries

  def show
    render Dato::Wrapper.new(HomepageComponent, homepage_query)
  end
end