require 'rails_helper'

RSpec.describe User::SignUp do
  describe '.call' do
    subject(:res) { User::SignUp.(params) }

    let(:params) do
      { user: { login: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: Faker::Internet.password } }
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

    it 'create a new Account for User' do
      model = res['model']
      is_asserted_by { model.account }
      is_asserted_by { model.account.persisted? }
      is_asserted_by { model.account.is_a? Account }
    end

    context 'when parameters are invalid:' do
      subject(:errors) { res['result.contract.default'].errors.messages }

      context 'no required parameter :login' do
        let(:params) { super().tap { |p| p[:user].delete(:login) } }
        it_is_asserted_by { errors.key? :login }
      end

      context 'no required parameter :email' do
        let(:params) { super().tap { |p| p[:user].delete(:email) } }
        it_is_asserted_by { errors.key? :email }
      end

      context 'no required parameter :password' do
        let(:params) { super().tap { |p| p[:user].delete(:password) } }
        it_is_asserted_by { errors.key? :password }
      end

      context 'option email an invalid format' do
        let(:params) { super().tap { |p| p[:user][:email] = 'foobar.com' } }
        it_is_asserted_by { errors.key? :email }
      end

      context 'option password has a length of less than 6 symbols' do
        let(:params) { super().tap { |p| p[:user][:password] = '12345' } }
        it_is_asserted_by { errors.key? :password }
      end
    end

    context 'when passed login already exists' do
      subject(:errors) { res['result.contract.default'].errors.messages }

      before do
        User::SignUp.(user: { login: 'tulio',
                              email: 'me@tuliuno.mx',
                              password: '123456' })
      end

      let(:params) do
        { user: { login: 'tulio',
                  email: 'me@tuliodo.mx',
                  password: '654321' } }
      end

      it_is_asserted_by { errors.key? :login }
    end

    context 'when passed email already exists' do
      subject(:errors) { res['result.contract.default'].errors.messages }

      before do
        User::SignUp.(user: { login: 'tuliuno',
                              email: 'me@tulio',
                              password: '123456' })
      end

      let(:params) do
        { user: { login: 'tuliodo',
                  email: 'me@tulio',
                  password: '654321' } }
      end

      it_is_asserted_by { errors.key? :email }
    end
  end
end
