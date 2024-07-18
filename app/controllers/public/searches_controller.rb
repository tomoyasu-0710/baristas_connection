class Public::SearchesController < ApplicationController
  
   before_action :authenticate_user!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    # 選択したモデルに応じて検索を実行
    if @model  == "post"
      @posts = Post.search_for(@content, @method)
    elsif @model == "cupping_note"
      @cupping_note = CuppingNote.search_for(@content, @method)
    else
      @users = User.search_for(@content, @method)
    end
  end
end
  
