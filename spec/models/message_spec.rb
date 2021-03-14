require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ送信機能' do
    context 'メッセージの送信ができないとき' do
      it 'contentとimageが空では送信できない' do
        @message.content = ''
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end
      it 'roomが紐づいていないと送信できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Room must exist')
      end
      it 'userが紐づいていないと送信できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('User must exist')
      end
    end

    context 'メッセージの送信ができるとき' do
      it 'contentとimageが存在していれば送信できる' do
        expect(@message).to be_valid
      end
      it 'contentが空でも送信できる' do
        @message.content = ''
        expect(@message).to be_valid
      end
      it 'imageが空でも送信できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
  end
end
