require 'rails_helper'
require 'support/user_context'

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

      fill_in :session_email, with: email
      fill_in :session_password, with: password
      click_on I18n.t(:sign_in)

      expect(page).to have_current_path(dashboard_path)
    end
  end
end
