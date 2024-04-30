class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]
    before_action :set_category, only: [:show]

    def new 
      @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        respond_to do |format|
            if @category.save
                format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
                format.json { render :show, status: :created, location: @category }
            else 
                format.html { render :new, status: 300 }
                format.json { render json: @category.errors, status: :unprocessable_entity}
            end
        end
    end

    def index
      @categories = Category.paginate(page: params[:page], per_page: 5)
    end

    def show
      
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def require_admin
      if !(logged_in? && current_user.admin?)
        flash[:alert] = "Only admins can perform that action"
        redirect_to categories_path
      end
    end
end