require 'rails_helper'
require 'support/user_context'
require 'support/shared_contexts/user_signed_in'
require 'support/shared_examples/user_not_signed_in'

RSpec.feature 'SessionManagements', type: :feature do
  context 'when user not signed in' do
    scenario '/dashboard redirect to login page' do
      visit '/dashboard'
      expect(page).to have_current_path(sign_in_path)
    end
  end

  context 'when registered user sign in' do
    let(:email) { 'foo@bar.com' }
    let(:password) { '12345678' }

    include_context 'user_context'

    scenario 'redirect to /dashboard after sign in' do
      visit '/sign_in'

      within('form#new_session') do
        fill_in :session_email, with: email
        fill_in :session_password, with: password
        click_on I18n.t(:sign_in)
      end

      expect(page).to have_current_path(dashboard_path)
    end
  end

  context 'when signed user click to Sign out' do
    include_context 'user signed in'
    before { click_on I18n.t(:sign_out) }
    it_behaves_like 'user not signed in'
  end
end
