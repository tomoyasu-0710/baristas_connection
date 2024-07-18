class Public::PostsController < ApplicationController
  
  before_action :set_guest_session, only: [:show]

  def new
    @post = current_user.posts.new
  end

  def index
    @posts = Post.all
    @tag_list = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @post_tags = @post.tags
    @user = @post.user
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def edit
    is_matching_login_user

    @post = Post.find(params[:id])
    # tagの編集
    @tag_list=@post.tags.pluck(:tag_name).join(nil)
  end

  def update
    @post = Post.find(params[:id])
     # 入力されたタグを受け取る
    tag_list = params[:post][:tag_name].split(',')
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

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @posts = @tag.posts.all           #クリックしたタグに紐付けられた投稿を全て表示
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
  
  def set_guest_session
    session[:guest] = true
  end
  
end
