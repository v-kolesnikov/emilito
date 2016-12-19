require 'rails_helper'

describe Session::SignIn do
  describe '.call' do
    subject(:res) { Session::SignIn.(params) }

    let!(:registered_user) do
      User::SignUp.(
        user: { login: Faker::Internet.user_name,
                email: 'foo@bar.com',
                password: '123456' }
      )['model']
    end

    let(:params) { { session: { email: 'foo@bar.com', password: '123456' } } }

    subject(:model) { res['model'] }
    subject(:errors) { res['result.contract.default'].errors.messages }

    it 'find a registered user by email' do
      is_asserted_by { res.success? }
      is_asserted_by { model == registered_user }
    end

    context 'when user with passed email not exists' do
      let(:params) { { session: { email: 'bar@foo.com', password: '123456' } } }
      it do
        is_asserted_by { res.failure? }
        is_asserted_by { model != registered_user }
        is_asserted_by { errors.key? :password }
      end
    end

    context 'when user with passed email is exists, but password is wrong' do
      let(:params) { { session: { email: 'foo@bar.com', password: '654321' } } }
      it do
        is_asserted_by { res.failure? }
        is_asserted_by { model != registered_user }
        is_asserted_by { errors.key? :password }
      end
    end

    context 'when the wrong email or password' do
      let(:wrong_email_params) { { email: 'bar@foo.com', password: '123456' } }
      let(:wrong_password_params) { { email: 'foo@bar.com', password: '123' } }
      it 'fails with the same error in both cases' do
        res1 = Session::SignIn.(session: wrong_email_params)
        errors1 = res1['result.contract.default'].errors.messages
        res2 = Session::SignIn.(session: wrong_password_params)
        errors2 = res2['result.contract.default'].errors.messages
        is_asserted_by { errors1 == errors2 }
      end
    end
  end
end
