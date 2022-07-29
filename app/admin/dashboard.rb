# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do 
        panel "Recent Products" do
          table_for Product.order('created_at desc').limit(5) do
            column :name
            column :sku
            column :price do |product|
              number_to_currency product.price_cents
            end
            column :stock
          end
        end
      end
      column do
        panel "Categories" do
          table_for Category.order('created_at desc').limit(5) do
            columns :name, :description
          end
        end
      end
    end
  end
end
