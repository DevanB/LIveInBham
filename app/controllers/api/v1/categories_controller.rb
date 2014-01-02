module Api
	module V1
		class CategoriesController < ApplicationController
			before_filter :restrict_access
			respond_to :json

			def index
				@categories = Category.all
				respond_with { @categories }
			end

		private
			def restrict_access
				api_key = ApiKey.find_by_access_token(params[:access_token])
				head :unauthorized unless api_key
			end
		    # Use callbacks to share common setup or constraints between actions.
		    def set_category
		      @category = Category.find(params[:id])
		    end

		    # Never trust parameters from the scary internet, only allow the white list through.
		    def category_params
		      params.require(:category).permit(:name, :catBegin, :catEnd)
		    end
		end
	end
end