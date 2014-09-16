class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    @words = Word.all

  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
    # @user = User.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json

  def create
    @word = Word.new(word_params)
    user = params["word"]["user_id"].gsub(/\W/, "")
    if User.find_by_handle(user)
      @word.user = User.find_by_handle(user)
      @word.made_by = current_user
    else
      user = User.new
      user_id_stripped = params["word"]["user_id"].gsub(/\W/, "")
      user.handle = user_id_stripped
      user.email = "#{user}@example.com"
      user.password = "password"
      user.save!
      @word.user = user
      @word.made_by = current_user
      # current user doesn't work, current_user.id returns integer i.e. 8
    end
    array = params["word"]["description"]
    array = array.join(' ')
    @word.description = array
    # d = description.downcase.gsub /\W+/, ' '
    if array.split.size > 6
      return redirect_to new_word_path, notice: "6Words Max!"
    end
    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  def tweet_example
    current_user.tweet("testing")
    redirect_to new_word_path, notice: "success"
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:user, :user_id, :made_by, :description => [])
    end
end
