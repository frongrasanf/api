class StaticPagesController < ApplicationController
  def index
    render plain: "This URL is API access only."
  end
end
