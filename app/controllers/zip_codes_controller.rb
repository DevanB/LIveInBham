class ZipCodesController < ApplicationController
  before_action :set_zip_code, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @zip_codes = ZipCode.all
  end

  def new
    authorize! :new, @user, :message => 'Not authorized as an administrator.'
    @zip_code = ZipCode.new
  end

  def edit
    authorize! :edit, @user, :message => 'Not authorized as an administrator.'
  end

  def create
    authorize! :create, @user, :message => 'Not authorized as an administrator.'
    @zip_code = ZipCode.new(zip_code_params)

    respond_to do |format|
      if @zip_code.save
        format.html { redirect_to @zip_code, notice: 'Zip code was successfully created.' }
        format.json { render action: 'show', status: :created, location: @zip_code }
      else
        format.html { render action: 'new' }
        format.json { render json: @zip_code.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    respond_to do |format|
      if @zip_code.update(zip_code_params)
        format.html { redirect_to @zip_code, notice: 'Zip code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @zip_code.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    @zip_code.destroy
    respond_to do |format|
      format.html { redirect_to zip_codes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zip_code
      @zip_code = ZipCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zip_code_params
      params.require(:zip_code).permit(:zip_code)
    end
end
