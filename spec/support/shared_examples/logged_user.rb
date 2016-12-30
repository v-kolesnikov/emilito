RSpec.shared_examples 'logged user' do
  context 'when go to /sign_in' do
    before { visit(sign_in_path) }
    it 'redirect to /dashboard' do
      is_asserted_by { page.current_path == dashboard_path }
    end
  end

  context 'when go to main page' do
    before { visit(root_path) }
    it { expect(page).to have_link(I18n.t(:your_dashboard)) }
  end
end
