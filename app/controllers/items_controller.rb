class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @items = Item.fined(params[:id])
    @items = Item.includes(:items_imag).find(params[:id])
  end
end           