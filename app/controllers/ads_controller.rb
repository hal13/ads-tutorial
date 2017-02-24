class AdsController < ApplicationController

  before_action :set_ad, only: [:show, :edit, :update]
  
  def index
    @ads = Ad.all
  end
  
  def show
  end

  def new
    @ad = Ad.new
  end

  def edit
  end

  def create
    @ad = Ad.new(ad_params)
    if @ad.save
      redirect_to ad_path(@ad.id)
    else
      render('new')
    end
  end

  def update
    if @ad.update(ad_params)
      redirect_to ad_path(@ad.id)
    else
      render('edit')
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:name, :description, :price, :seller_id, :email, :img_url)
  end
end
