require 'rails_helper'
require 'support/shared_examples/operation'

describe Account::Create do
  describe '.run' do
    let(:params) { { account: { user: attributes_for(:user, :create_form) } } }

    include_examples 'create operation', Account

    subject { Account::Create.run(params).last }

    it 'create a new User as Account owner' do
      expect(subject.model.user).to be
      expect(subject.model.user).to be_kind_of User
      expect(subject.model.user).to eq subject.model.owner
    end

    context 'when params invalid' do
      subject { Account::Create.run(account: params).last }

      context 'option user not passed' do
        let(:params) { { foo: nil } }
        it { expect(subject).to be_fail_with_key :user }
      end

      context 'option user.email not passed' do
        let(:params) { { user: { password: '123456' } } }
        it { expect(subject).to be_fail_with_key :'user.email' }
      end

      context 'option user.password not passed' do
        let(:params) { { user: { email: 'foo@bar.io' } } }
        it { expect(subject).to be_fail_with_key :'user.password' }
      end

      context 'option user.password has a length of less than 6 symbols' do
        let(:params) { { user: { email: 'foo@bar.io', password: '12345' } } }
        it { expect(subject).to be_fail_with_key :'user.password' }
      end

      context 'option user.password_confirmation not passed' do
        let(:params) { { user: { email: 'foo@bar', password: '123456' } } }
        it { expect(subject).to be_fail_with_key :'user.password_confirmation' }
      end
    end
  end
end
