class RatesController < ApplicationController

  def update
    @rate = Rate.unscope(:where).find(params[:id])
    @castle = @rate.castle
    @rateval = params[:stars].to_f
    @rateval = ((@rateval*2).round)/2.0
    if @rate.update_attributes(stars: @rateval)
      respond_to do |format|
        format.js
      end
    end
    @castle.update_attributes(rating_average: @castle.average_rating)
  end

end