require 'rails_helper'
require 'support/shared_examples/operation'

describe User::Create do
  describe '.run' do
    let(:params) { { user: attributes_for(:user, :create_form) } }

    include_examples 'create operation', User

    context 'when params invalid' do
      subject { User::Create.run(params).last }

      context 'option email not passed' do
        let(:params) { { user: { password: '123456' } } }
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

      context 'option password_confirmation not passed' do
        let(:params) { { user: { email: 'foo@bar', password: '123456' } } }
        it { expect(subject).to be_fail_with_key :password_confirmation }
      end
    end
  end
end
