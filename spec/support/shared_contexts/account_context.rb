require 'rails_helper'

RSpec.shared_context 'account context' do
  let!(:account) do
    Account::Create.(account: {})['model']
  end
end
