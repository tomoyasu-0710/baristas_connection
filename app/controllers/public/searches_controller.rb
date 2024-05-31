class Public::SearchesController < ApplicationController
  
   before_action :authenticate_user!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    # 選択したモデルに応じて検索を実行
    if @model  == "post"
      @records = Post.search_for(@content, @method)
    else
      @records = CuppingNote.search_for(@content, @method)
    end
  end
end
  
