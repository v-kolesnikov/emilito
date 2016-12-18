require 'rails_helper'

describe User::Create do
  describe '.call' do
    subject(:res) { User::Create.(params) }

    let(:params) do
      { user: { login: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: 'password' } }
    end

    it 'returns the operation result' do
      is_asserted_by { res }
      is_asserted_by { res['model'] }
      is_asserted_by { res['contract.default.class'] }
      is_asserted_by { res['representer.render.class'] }
    end

    it 'create a new User' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.persisted? }
      is_asserted_by { model.is_a? User }
    end

    context 'when parameters are invalid:' do
      let(:errors) { res['result.contract.default'].errors.messages }

      context 'no required parameter :email' do
        let(:params) { super().tap { |p| p[:user].delete(:email) } }
        it do
          is_asserted_by { res.failure? }
          is_asserted_by { errors.key? :email }
        end
      end

      context 'no required parameter :password' do
        let(:params) { super().tap { |p| p[:user].delete(:password) } }
        it do
          is_asserted_by { res.failure? }
          is_asserted_by { errors.key? :password }
        end
      end
    end
  end
end
