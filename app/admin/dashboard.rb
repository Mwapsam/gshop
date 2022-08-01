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
            column :sales_count
            column :price do |product|
              number_to_currency product.price_cents
            end
            column :stock
          end
        end
      end
      column do
        panel "Orders" do
          table_for Order.order('created_at desc').limit(5) do
            column :ammount 
            column :shipping_address
            column :order_address
            column :order_mail
            column :status
            column :user_id
          end
        end
      end
    end
  end
end
