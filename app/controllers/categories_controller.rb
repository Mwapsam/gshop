class CategoriesController < ApplicationController
    def index
        @category = Category.all
    end
end
