class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new

  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        flash[:notice] = "「#{@blog.title}」のブログを作成しました！"
        redirect_to blogs_path
      else
        render :new
      end
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def show
    @comment = Comment.new(blog_id: @blog.id)
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    flash[:success] = "「#{@blog.title}」のブログを編集しました！"
    redirect_to blogs_path
  end

  def destroy
    @blog.delete
    flash[:danger] = "「#{@blog.title}」のブログを削除しました！"
    redirect_to blogs_path
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:name, :title, :body, :image, :image_cache)
  end


end
