class Contact < ApplicationRecord
  belongs_to :kind
  has_one :address, inverse_of: :contact
  has_many :phones
   
 accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank
 accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: :all_blank
end
