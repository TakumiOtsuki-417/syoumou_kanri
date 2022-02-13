class ItemsController < ApplicationController
  def index
    @items = Item.all
    sum_price = 0
    @items.each do |item|
      sum_price += item[:price]
    end
    @all_price = sum_price
    # showのリストとの内容分岐
    @rest = nil
  end
  def show
    @item = Item.find(params[:id])
    @damages = Damage.where(item_id: @item.id)
    @total_damage_amount = 0
    @damages.each do |damage|
      @total_damage_amount += damage.amount
    end
    @rest = @item.amount - @total_damage_amount
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
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
