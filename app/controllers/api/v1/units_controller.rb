module Api
	module V1
		class UnitsController < ApplicationController
			before_filter :restrict_access
			respond_to :json

			def index
				@units = Unit.all
				respond_with { @units }
			end

			def featured
				@units = Unit.featured.all
				respond_with { @units }
			end
			def viewer
				@units = Unit.all
				respond_with { @units }
			end

		private
			def restrict_access
				api_key = ApiKey.find_by_access_token(params[:access_token])
				head :unauthorized unless api_key
			end
		    # Use callbacks to share common setup or constraints between actions.
		    def set_unit
		      @unit = Unit.find(params[:id])
		    end
		    # Never trust parameters from the scary internet, only allow the white list through.
		    def unit_params
		      params.require(:unit).permit(:featured, :number, :avail_date, :title, :description, :bedrooms, :bathrooms, :price, :link, :image)
		    end
		end
	end
end