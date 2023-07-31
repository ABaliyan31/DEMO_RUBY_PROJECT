class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[ show edit update destroy ]


  # GET /microposts or /microposts.json
  def index
    if current_user == nil
      redirect_to login_url
    end
      @microposts = Micropost.all
  end

  # GET /microposts/1 or /microposts/1.json
  def show
    begin
      @micropost = Micropost.find(params[:id])
      if @micropost.present == 0
        redirect_to '/404'
      end
      if current_user == nil
        redirect_to login_url
      end
    rescue ActiveRecord::RecordNotFound => e
      redirect_to '/404'
    end
  end

  # GET /microposts/new
  def new
    if current_user == nil
      redirect_to login_url
    else
    @micropost = Micropost.new
    end
  end

  # GET /microposts/1/edit
  def edit
    @micropost = Micropost.find(params[:id])
    if @micropost.present == 0
      redirect_to '/404'
    end
    micropost_user = @micropost.user_id
    if current_user == nil || @micropost.user_id != current_user.id
      redirect_to login_url
    end
  end

  # POST /microposts or /microposts.json
  def create
    if current_user == nil || current_user.id != micropost_params[:user_id].to_i
      redirect_to login_url
    else
      @micropost = Micropost.new(micropost_params)
      content_image = @micropost.content
      respond_to do |format|
       if @micropost.save
         format.html { redirect_to user_url(current_user), notice: "Micropost was successfully created." }
         format.json { render :show, status: :created, location: @micropost }
       else
         format.html { render :new, status: :unprocessable_entity }
         format.json { render json: @micropost.errors, status: :unprocessable_entity }
       end
      end
    end
  end

  # PATCH/PUT /microposts/1 or /microposts/1.json
  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.present == 0
      redirect_to '/404'
    end
    if current_user == nil || @micropost.user_id != current_user.id
      redirect_to login_url
    else
    new_content = micropost_params[:content]
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to micropost_url(@micropost), notice: "Micropost was successfully updated." }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /microposts/1 or /microposts/1.json
  def destroy
    current_micropost = Micropost.find(params[:id])
    user_id = current_micropost.user_id
    user_object = User.find(user_id)
    if current_user == nil || user_object.id != current_user.id
      redirect_to login_url
    else
      current_micropost.update(present: 0)
      respond_to do |format|
        format.html { redirect_to user_path(user_object), notice: "Micropost was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      begin
        @micropost = Micropost.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        redirect_to '/404'
      end
    end

    # Only allow a list of trusted parameters through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id, :present)
    end
end
