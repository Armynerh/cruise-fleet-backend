class ItemsController < ApplicationController
  def index
    @items = Item.all

    respond_to do |format|
      format.html
      format.json { render json: { result: { items: @items } } }
    end
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: { result: { item: @item } } }
    end
  end

  def create
    item_params = params.require(:item).permit(:name, :availability, :photo, :cost)

    @result = if (@item = Item.create!(item_params))
                'Item Created Succesfully!'
              else
                'Item not Created!!!'
              end

    respond_to do |format|
      format.html
      format.json { render json: { result: @result, item: @item } }
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @result = if @item.destroy
                'Item destroyed!'
              else
                'Item not destroyed!!!'
              end

    respond_to do |format|
      format.html
      format.json { render json: { result: @result, item: @item } }
    end
  end

  def update
    item_update_params = params.require(:item).permit(:name, :availability, :photo, :cost)
    @item = Item.find(params[:id])

    @result = if @item.update(item_update_params)
                'Item updated succesfully!'
              else
                'Item not updated!!!'
              end

    respond_to do |format|
      format.html
      format.json { render json: { result: @result, item: @item } }
    end
  end
end
