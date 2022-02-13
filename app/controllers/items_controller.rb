class ItemsController < ApplicationController
  def index
    @items = Item.all
    sum_price = 0
    @items.each do |item|
      sum_price += item[:price]
    end
    @all_price = sum_price  
  end
  def show
    @item = Item.find(params[:id])
    @items = []
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.valid?
      @error = @item.errors.full_messages
      binding.pry
      render :new
    end
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  private
  def item_params
    params.require(:item).permit(:name, :date, :genre_id, :from_id, :amount, :price, :comment)
  end

end
