ActiveAdmin.register Product do
  permit_params do
    permitted = [:sku, :name, :price, :weight, :description, :category, :stock, :image, :thumbnails]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end
  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      input :image , as: :file, hint: f.object.image.present? ? image_tag(f.object.image.variant(resize: '200x200')) : content_tag(:span, "No image yet")
      input :thumbnails, as: :file, multiple: true, hint: f.object.thumbnails.map do |thumbnail|
        image_tag(thumbnail.variant(resize: '200x200'))
      end
    end
    f.actions
  end
end
