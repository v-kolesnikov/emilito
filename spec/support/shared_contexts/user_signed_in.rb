require 'rails_helper'
require 'support/user_context'

RSpec.shared_context 'user signed in' do
  include_context 'user_context'
  before do
    visit sign_in_path

    within('form#new_session') do
      fill_in :session_email, with: email
      fill_in :session_password, with: password
      click_on I18n.t(:sign_in)
    end
  end
end
