ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :sku, :name, :price, :weight, :description, :category, :stock
  #
  # or
  #
  # permit_params do
  #   permitted = [:sku, :name, :price, :weight, :description, :category, :stock]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
