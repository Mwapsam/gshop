ActiveAdmin.register Product do
  permit_params do
    permitted = [:sku, :name, :price, :weight, :description, :category, :stock, :mage, :thumbnails]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
end
