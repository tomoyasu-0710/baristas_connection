class Public::CuppingNotesController < ApplicationController
  
  def new
    
  end

  def index
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def calculate_total
    flavor = params[:flavor].to_i
    after_taste = params[:after_taste].to_i
    acidity = params[:acidity].to_i
    mouth_feel = params[:mouth_feel].to_i
    clean_cup = params[:clean_cup].to_i
    sweetness = params[:sweetness].to_i
    harmony = params[:harmony].to_i
  
    @total = flavor + after_taste + acidity + mouth_feel + clean_cup + sweetness + harmony
  
    # 合計値をビューテンプレートへ渡すためにインスタンス変数に代入
    @total = @total
  end
  
end
