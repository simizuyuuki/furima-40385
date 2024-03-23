class RecordShipAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :post_code, :prefectur_id, :municipalities, :address, :telephone

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefectur_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :telephone, presence: true, format: { with: /\A\d{10,11}\z/ }
    validates :token, presence: true
  end
    def save
      record = Record.create(user_id: user_id, item_id: item_id)
      Ship_address.create(post_code: post_code, prefectur_id: prefectur_id, municipalities: municipalities, address: address, telephone: telephone)
    end
  
end