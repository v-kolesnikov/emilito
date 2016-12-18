require 'rails_helper'

describe User::Delete do
  describe '.call' do
    subject(:res) { User::Delete.(params) }

    let(:user) { User::Create.(user: attributes_for(:user))['model'] }

    let(:params) { { id: user.id } }

    it 'delete a exist User' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.destroyed? }
    end
  end
end
