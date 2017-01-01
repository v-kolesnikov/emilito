require 'rails_helper'
require 'support/shared_contexts/workspace_context'

RSpec.shared_context 'ticket context' do
  include_context 'workspace context'

  let!(:ticket) { create(:ticket, workspace: workspace) }
end
