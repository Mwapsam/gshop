class OrderDetailsController < ApplicationController
    def new
        @order_detail = OrderDetail.new
        @product = Product.find(params[:id])
        @order = Order.find(params[:id])
    end
    
    def create
        @order_detail = OrderDetail.new(order_detail_params)
        @order_detail.save
    end

    private

    def order_detail_params
        params.permit(:order_id, :product_id, :quantity)
    end
end
