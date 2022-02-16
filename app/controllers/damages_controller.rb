class DamagesController < ApplicationController
  before_action :damage_item
  def new
    @damage = Damage.new
  end
  def create
    @damage = Damage.new(damage_params)
    if @damage.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end
  def edit
    @damage = Damage.find(params[:id])
  end
  def update
    @damage = Damage.find(params[:id])
    if @damage.update(damage_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  def destroy
    damage = Damage.find(params[:id])
    damage.destroy
    redirect_to item_path(@item.id)
  end
  private
  def damage_item
    @item = Item.find(params[:item_id])
  end
  def damage_params
    params.require(:damage).permit(:date, :amount, :comment, :item_id)
  end

end
