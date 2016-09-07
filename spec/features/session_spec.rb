require 'rails_helper'
require 'support/shared_contexts/user_context'
require 'support/shared_contexts/user_signed_in'
require 'support/shared_examples/not_logged_user'

RSpec.feature 'Feature::Session', type: :feature do
  context 'when user not signed in' do
    scenario '/dashboard redirect to login page' do
      visit '/dashboard'
      expect(page).to have_current_path(sign_in_path)
    end
  end

  context 'when registered user sign in' do
    include_context 'user context' do
      let(:email) { 'foo@bar.com' }
      let(:password) { '12345678' }
    end

    scenario 'redirect to /dashboard after login' do
      visit '/sign_in'

      within('form#new_session') do
        fill_in :session_email, with: 'foo@bar.com'
        fill_in :session_password, with: '12345678'
        click_on I18n.t(:sign_in)
      end

      expect(page).to have_current_path(dashboard_path)
    end
  end

  context 'when signed user click to Sign out' do
    include_context 'user signed in'
    before { click_on I18n.t(:sign_out) }
    it_behaves_like 'not logged user'
  end
end
