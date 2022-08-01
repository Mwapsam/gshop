class CategoriesController < ApplicationController
    def index
        @category = Category.all
    end

    def show
        @products = Product.where(category_id: params[:id])
    end
end
