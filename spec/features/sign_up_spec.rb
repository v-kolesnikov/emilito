require 'rails_helper'
require 'support/shared_contexts/user_signed_in'
require 'support/shared_examples/logged_user'

RSpec.feature 'Feature::SignUp', type: :feature do
  shared_context 'fill sign up form' do
    before do
      within('form#new_user') do
        fill_in :user_login, with: login
        fill_in :user_email, with: email
        fill_in :user_password, with: password
        click_on I18n.t(:sign_up)
      end
    end
  end

  context 'when unsigned user go to /' do
    before { visit(root_path) }
    it { expect(page).to have_link(I18n.t(:sign_up)) }
    it { expect(page).to have_button(I18n.t(:sign_up)) }
  end

  context 'when unsigned user fill sign_up form' do
    before { visit(sign_up_path) }
    include_context 'fill sign up form' do
      let(:login) { Faker::Internet.user_name }
      let(:email) { Faker::Internet.email }
      let(:password) { Faker::Internet.password }
    end

    it 'redirect to /dashboard after sign up' do
      expect(page).to have_current_path(dashboard_path)
    end

    it_behaves_like 'logged user'
  end

  context 'when sign up form is not valid (e.g. password is too short)' do
    before { visit(sign_up_path) }
    include_context 'fill sign up form' do
      let(:login) { Faker::Internet.user_name }
      let(:email) { Faker::Internet.email }
      let(:password) { 'foo' }
    end
    it { expect(page).to have_current_path(sign_up_path) }
  end

  context 'when user signed in' do
    include_context 'user signed in'
    scenario '/sign_up redirect to /dashboard page' do
      visit sign_up_path
      expect(page).to have_current_path(dashboard_path)
    end
  end
end
