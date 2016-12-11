require 'rails_helper'
require 'support/shared_examples/operation'
require 'support/shared_contexts/user_context'

describe User::SignUp do
  describe '.run' do
    let(:params) do
      { user: {
        login: Faker::Internet.user_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
      } }
    end

    include_examples 'create operation', User

    subject { User::SignUp.run(params).last }

    it 'create a new Account for User' do
      expect(subject.model.account).to be
      expect(subject.model.account.persisted?).to be
      expect(subject.model.account).to be_kind_of Account
    end

    context 'when params invalid' do
      context 'option login not passed' do
        let(:params) { { user: { email: 'foo@bar.io', password: '123456' } } }
        it { expect(subject).to be_fail_with_key :login }
      end

      context 'option email not passed' do
        let(:params) { { user: { password: '123456' } } }
        it { expect(subject).to be_fail_with_key :email }
      end

      context 'option email an invalid format' do
        let(:params) { { user: { email: 'foobar.com' } } }
        it { expect(subject).to be_fail_with_key :email }
      end

      context 'option password not passed' do
        let(:params) { { user: { email: 'foo@bar.io' } } }
        it { expect(subject).to be_fail_with_key :password }
      end

      context 'option password has a length of less than 6 symbols' do
        let(:params) { { user: { email: 'foo@bar.io', password: '12345' } } }
        it { expect(subject).to be_fail_with_key :password }
      end
    end

    context 'when passed login already exists' do
      before do
        params = { login: 'tulio', email: 'me@tuliuno.mx', password: '123456' }
        User::Create.(user: params.merge(password_confirmation: '123456'))
      end

      let(:params) do
        { user: { login: 'tulio', email: 'me@tuliodo.mx', password: '654321' } }
      end

      it { expect(subject).to be_fail_with_key :login }
    end

    context 'when passed email already exists' do
      include_context 'user context' do
        let(:email) { 'me@tulio.mx' }
        let(:password) { '123456' }
      end

      let(:params) do
        { user: { login: 'tulio', email: 'me@tulio.mx', password: '123456' } }
      end

      it { expect(subject).to be_fail_with_key :email }
    end
  end
end
