require 'rails_helper'

describe Session::SignIn do
  describe '.run' do
    let!(:registerd_user) do
      User::Create.(
        user: { email: 'foo@bar.com',
                password: '123456',
                password_confirmation: '123456' }
      ).model
    end

    let(:params) { { session: { email: 'foo@bar.com', password: '123456' } } }

    subject { Session::SignIn.run(params).last }

    it 'find a registered user by email' do
      expect(subject).to be_success
      expect(subject.model).to eq registerd_user
    end

    context 'when user with passed email not exists' do
      let(:params) { { session: { email: 'bar@foo.com', password: '123456' } } }
      it { expect(subject).to be_fail_with_key :password }
    end

    context 'when user with passed email is exists, but password is wrong' do
      let(:params) { { session: { email: 'foo@bar.com', password: '654321' } } }
      it { expect(subject).to be_fail_with_key :password }
    end

    context 'when the wrong email or password' do
      let(:wrong_email_params) { { email: 'bar@foo.com', password: '123456' } }
      let(:wrong_password_params) { { email: 'foo@bar.com', password: '123' } }
      it 'fails with the same error in both cases' do
        op1 = Session::SignIn.run(session: wrong_email_params).last
        op2 = Session::SignIn.run(session: wrong_password_params).last
        expect(op1.contract.errors.messages).to eq op2.contract.errors.messages
      end
    end
  end
end
