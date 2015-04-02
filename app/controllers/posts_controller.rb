class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def home
  end
  # GET /posts
  # GET /posts.json
  def index
     @posts = Post.all.paginate(:page =>params[:page], :per_page => 50)
     @posts = @posts.where(speaker_party: params["speaker_party"]) if params["speaker_party"].present?
     @posts = @posts.where(speaker_state: params["speaker_state"]) if params["speaker_state"].present?

     @posts = @posts.where(speaker_last: params["speaker_last"]) if params["speaker_last"].present?

     @posts = @posts.where(speaking: params["speaking"]) if params["speaking"].present?
      
      @posts = @posts.where(chamber: params["chamber"]) if params["chamber"].present?
      
      @posts = @posts.where(title: params["title"]) if params["title"].present?
      
      @posts = @posts.where(date: params["date"]) if params["date"].present?
      
      @posts = @posts.where(origin_url: params["origin_url"]) if params["origin_url"].present?
      
      @posts = @posts.where(number: params["number"]) if params["number"].present?
      
      @posts = @posts.where(order: params["order"]) if params["order"].present?
      
      
      @posts = @posts.where(volume: params["volume"]) if params["volume"].present?
      
      @posts = @posts.where(pages: params["pages"]) if params["pages"].present?

      @posts = @posts.where(bioguide_id: params["bioguide_id"]) if params["bioguide_id"].present?

      @posts = @posts.where(speaker_raw: params["speaker_raw"]) if params["speaker_raw"].present?

  end


  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:speaker_state, :speaker_first, :speaker_last, :speaker_party, :speaking)
    end
end
