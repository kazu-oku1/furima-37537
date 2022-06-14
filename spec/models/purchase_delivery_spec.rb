require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値とtokenが正しく入力されていれば保存できること' do
        expect(@purchase_delivery).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_delivery.building_name = ''
        expect(@purchase_delivery).to be_valid
      end
    end
    
    context '内容に問題がある場合' do 
      it 'postal_codeが空だと保存できないこと' do
        @purchase_delivery.postal_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが「3桁-4桁」の半角文字列でないと保存できないこと' do
        @purchase_delivery.postal_code = '１'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)") 
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_delivery.prefecture_id = '1'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank") 
      end
      it 'cityが空だと保存できないこと' do
        @purchase_delivery.city = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank") 
      end
      it 'addressが空だと保存できないこと' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank") 
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_delivery.phone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank") 
      end
      it 'phone_numberが10桁以上11桁以内の半角数字でないと保存できないこと' do
        @purchase_delivery.phone_number = '123456789'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid. is too short")
      end
      it 'userが紐づいていないと保存できないこと' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank") 
      end
    end
  end
end
