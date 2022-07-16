class ProductOption < ApplicationRecord
  belongs_to :product
  belongs_to :option
end
