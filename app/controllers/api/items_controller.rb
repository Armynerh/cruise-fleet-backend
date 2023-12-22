class Api::ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item
    else
      render json: @item.errors
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      render json: @item
    else
      render json: @item.errors
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :availability, :photo, :cost)
  end
end
