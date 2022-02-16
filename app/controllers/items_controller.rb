class ItemsController < ApplicationController
  def index
    # item一覧表示の用意
    @items = Item.all
    # 合計
    sum_price = 0
    @items.each do |item|
      sum_price += item[:price]
    end
    @all_price = sum_price
    # showのリストとの内容分岐
    @rest = nil
    @damages = Damage.all
    # 以下、週別の実装
    today = Date.today
    @sunday = today - today.wday # 今週の日曜日の日付
    asc_date = @items.order(date: "asc").limit(1)
    oldest_date = asc_date[0].date
    oldest_sunday = oldest_date - oldest_date.wday
    @week_num = ((@sunday - oldest_sunday).to_i) / 7 # 何週分ループするかを計算
    # 以下、月別の実装
    month_length = (oldest_date..today).select{|d| d.day == 1}



  end
  def search
    @items = Item.all
    # showのリストとの内容分岐
    @rest = nil
    if params["date(1i)"].to_i == nil
      @search_items = "期間を選択してください"
    else
      search_date = Date.new(params["search(1i)"].to_i, params["search(2i)"].to_i, params["search(3i)"].to_i)
      # search_year = params[:date].year
      # search_month = params[:date].month
      search_date_end = search_date.end_of_month
      @search_items = @items.where(date: search_date..search_date_end)
    end
    # render :index
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
