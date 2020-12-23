class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.categories.build
  end


  
  def create
    # @post = Post.create(title: post_params[:title], content: post_params[:content])
    # post_params[:category_ids].each do |id|
    #   if id != ""
    #     PostCategory.create(post_id: @post.id, category_id: id)
    #   end 
    # end

    # post_params[:categories_attributes].values.each do |h|
    #   if h[:name] != ""
    #     category = Category.create(name: h[:name])
    #     PostCategory.create(post_id: @post.id, category_id: category.id)
    #   end
    # end
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
