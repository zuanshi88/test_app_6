class ArticlesController < ApplicationController
                                      #[ :show, :edit, :update, :destroy ]
  before_action :set_article, only: %i[ show edit update destroy ]


  # GET /articles or /articles.json
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  # GET /articles/1 or /articles/1.json
  def show
    #does not need this? Intuits the desigh...
    # aka knows the design
    # aka is the design
    # @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = User.first 

    respond_to do |format|
      if @article.save
                # this uses shortened path article_url(@article)
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
   

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "The article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #white-listing so-to-speak
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
