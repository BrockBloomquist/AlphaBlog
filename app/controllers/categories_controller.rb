class CategoriesController < ApplicationController
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
                format.html { render :new  }
                format.json { render json: @category.errors }
            end
        end
    end

    def index
    
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
end