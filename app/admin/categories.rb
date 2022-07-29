ActiveAdmin.register Category do
  permit_params :name, :description, :image
  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      input :image , as: :file, hint: f.object.image.present? ? image_tag(f.object.image.variant(resize: '200x200')) : content_tag(:span, "No image yet")
    end
    f.actions
  end
end
