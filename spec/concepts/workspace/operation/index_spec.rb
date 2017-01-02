require 'rails_helper'
require 'support/shared_contexts/account_context'

RSpec.describe Workspace::Index do
  describe '.call' do
    subject(:result) { Workspace::Index.(params) }

    context 'when requested account have a 3 Workspace\'s (@workspaces)' do
      include_context 'account context'
      let(:params) { { account_id: account.id } }

      before do
        @workspaces = Array.new(3) do |i|
          params = { workspace: { title: "workspace_#{i}" } }
          Workspace::Create.(account_id: account.id, **params)['model']
        end
      end

      it_is_asserted_by { result.success? }
      it_is_asserted_by { result['model'].size == 3 }
      it_is_asserted_by { result['model'] == @workspaces }

      context 'when another account have 1 Workspace (@workspace)' do
        let(:account_2) { Account::Create.(account: {})['model'] }

        before do
          @workspace = Workspace::Create.(
            account_id: account_2.id,
            workspace: attributes_for(:workspace)
          )['model']
        end

        it_is_asserted_by { !result['model'].include? @workspace }

        context 'when request another account workspaces' do
          let(:params) { { account_id: account_2.id } }

          it_is_asserted_by { result.success? }
          it_is_asserted_by { result['model'].size == 1 }
          it_is_asserted_by { result['model'].include? @workspace }
        end
      end
    end
  end
end
