class BlogPostsController < ApplicationController
  include DatoQueries

  def show
    render Dato::Wrapper.new(BlogPostComponent,
                             blog_post_query(params[:slug]),
                             preview: params[:preview], live: params[:live])
  end
end