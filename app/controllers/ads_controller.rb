class AdsController < ApplicationController

  before_filter :check_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:destroy]
  
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
      render :new
    end
  end

  def update
    if @ad.update(ad_params)
      redirect_to ad_path(@ad.id)
    else
      render :edit
    end
  end

  def destroy
    if @ad.destroy
      redirect_to ads_path
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:name, :description, :price, :seller_id, :email, :img_url)
  end

  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
      username == "admin" && password == "bjifilm_001"
    end
  end
end
