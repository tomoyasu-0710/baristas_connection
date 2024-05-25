class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def index
    @post = Post.all
    @post_tag=PostTag.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_tags = @post.tags
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list=params[:post][:name].split(',')
  if @post.save
    @post.save_tag(tag_list)
    redirect_to posts_path,notice:'投稿完了しました'
  else
    render :new
  end
  end

  def edit
    
    is_matching_login_user
  end

  def update
    @post = Post.find(params[:id])
     # 入力されたタグを受け取る
    tag_list = params[:post][:name].split(',')
    if  @post.update(post_params)
      # このpost_idに紐づいていたタグを@oldに入れる
      @old_relations=PostTag.where(post_id: @post.id)
      # それらを取り出し、消す。消し終わる
      @old_relations.each do |relation|
      relation.delete
      end  
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id), notice: '更新完了しました'
    else
        render :edit
    end
  end
  

  def destroy
    is_matching_login_user
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  
  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
　　#検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
　　#検索されたタグに紐づく投稿を表示
    @posts=@tag.posts.page(params[:page]).per(10)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
  
  def is_matching_login_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
    if @post.save
      redirect_to post_path
    else
      render :new
    end
    end
  end
end
