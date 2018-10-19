class ToppagesController < ApplicationController
  def index
    @circles = Circle.order("updated_at DESC")
  end
end
