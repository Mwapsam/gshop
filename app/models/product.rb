class Product < ApplicationRecord
  has_one_attached :mage
  has_many_attached :thumbnails
  
  def to_s
    name
  end

  monetize :price, as: :price_cents

  def to_builder
    Jbuilder.new do |product|
      product.price stripe_price_id
      product.quantity 1
    end
  end

  after_create do
    product = Stripe::Product.create(name:)
    price = Stripe::Price.create(product:, unit_amount: self.price, currency:)
    update(stripe_product_id: product.id, stripe_price_id: price.id)
  end

  after_update :create_and_assign_new_stripe_price, if: :saved_change_to_price?
  after_update :create_and_assign_new_stripe_price, if: :saved_change_to_currency?

  def create_and_assign_new_stripe_price
    price = Stripe::Price.create(product: stripe_product_id, unit_amount: self.price, currency:)
    update(stripe_price_id: price.id)
  end
end
