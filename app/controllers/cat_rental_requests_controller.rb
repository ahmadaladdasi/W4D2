class CatRentalRequestsController < ApplicationController

  def new
    @crr = CatRentalRequest.new
    render :new
  end

  def create
    @crr = CatRentalRequest.new(crr_params)
    @crr.save!
    redirect_to cat_rental_requests_url
  end

  def crr_params
    params.require(:crr).permit(:cat_id, :start_date, :end_date, :status)
  end


end
