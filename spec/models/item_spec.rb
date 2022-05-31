require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it 'titleとexplanation、price、image、category_id、condition_id、postage_type、prefecture_id、preparation_day_idがあれば商品は保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品の保存ができない場合' do
      it 'imageがないと商品は保存できない' do
      
      end
      it 'titleがないと商品は保存できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationがないと商品は保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'imageがないと商品は保存できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include(" can't be blank")
      end
      it 'category_idがないと商品は保存できない' do
        @item. = ''
        @item.valid?
        expect(@item.errors.full_messages).to include(" can't be blank")
      end
      it 'condition_idがないと商品は保存できない' do
        @item. = ''
        @item.valid?
        expect(@item.errors.full_messages).to include(" can't be blank")
      end
      it 'postage_type_idがないと商品は保存できない' do
        @item. = ''
        @item.valid?
        expect(@item.errors.full_messages).to include(" can't be blank")
      end
      it 'prefecture_idがないと商品は保存できない' do
        @item. = ''
        @item.valid?
        expect(@item.errors.full_messages).to include(" can't be blank")
      end
      it 'preparation_day_idがないと商品は保存できない' do
        @item. = ''
        @item.valid?
        expect(@item.errors.full_messages).to include(" can't be blank")
      end
      it 'ユーザーが紐づいていないと商品は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
