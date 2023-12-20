class ItemsController < ApplicationController
  def index
    @items = Item.all

    respond_to do |format|
      format.html
      format.json { render json: {result: { items: @items } } }
    end
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: { result: {item: @item} } }
    end
  end

  def create
    item_params = params.require(:item).permit(:name, :availability, :photo, :cost)

    if @item = Item.create!(item_params)
      @result = "Item Created Succesfully!"
    else
      @result = "Item not Created!!!"
    end

    respond_to do |format|
      format.html
      format.json { render json: { result: @result, item: @item } }
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy 
      @result = "Item destroyed!"
    else
      @result = "Item not destroyed!!!"
    end

    respond_to do |format|
      format.html
      format.json { render json: { result: @result, item: @item } }
    end
  end

  def update
    item_update_params = params.require(:item).permit(:name, :availability, :photo, :cost)
    @item = Item.find(params[:id])

    if @item.update(item_update_params)
      @result = "Item updated succesfully!"
    else
      @result = "Item not updated!!!"
    end

    respond_to do |format|
      format.html
      format.json { render json: { result: @result, item: @item } }
    end
  end
end