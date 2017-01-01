require 'rails_helper'
require 'support/shared_contexts/account_context'

RSpec.shared_context 'workspace context' do
  include_context 'account context'

  let!(:workspace) { create(:workspace, account: account) }
end
