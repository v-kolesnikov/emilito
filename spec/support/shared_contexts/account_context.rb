require 'rails_helper'

RSpec.shared_context 'account context' do
  let!(:account) { create(:account) }
end
