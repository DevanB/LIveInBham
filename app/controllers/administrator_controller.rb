class AdministratorController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @buildings = Building.all
    @zip_codes = ZipCode.all
    @users = User.all
    @units = Unit.all
  end
end
