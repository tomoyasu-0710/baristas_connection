class Public::CuppingNotesController < ApplicationController
  
  def new
    @cupping_note = CuppingNote.new
  end

  def index
    @cupping_note = CuppingNote.all
  end

  def show
  end

  def create
    @cuppping_note = CuppingNote.new(cupping_note_params)
    @cupping_note.user_id = current_user.id
    @cupping_note.save
    redirect_to cupping_notes_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def cupping_note
    params.require(:cupping_note).permit(:sample_name, :roast, :dry, :crust, :break, :flavor, :after_taste, :acidity, :mouth_feel, :clean_cup, :sweetness, :harmony, :memo, :over_all)
  end
  
  def calculate_total
    flavor = params[:flavor].to_i
    after_taste = params[:after_taste].to_i
    acidity = params[:acidity].to_i
    mouth_feel = params[:mouth_feel].to_i
    clean_cup = params[:clean_cup].to_i
    sweetness = params[:sweetness].to_i
    harmony = params[:harmony].to_i
    over_all = params[:over_all].to_i
  
    @total = flavor + after_taste + acidity + mouth_feel + clean_cup + sweetness + harmony + over_all
  
    # 合計値をビューテンプレートへ渡すためにインスタンス変数に代入
    @total = @total
  end
  
end
