RSpec.shared_examples 'not logged user' do
  context 'when go to /dashboard' do
    before { visit(dashboard_path) }
    it 'redirect to /sign_in' do
      is_asserted_by { page.current_path == sign_in_path }
    end
  end

  context 'when go to main page' do
    before { visit(root_path) }
    it { expect(page).not_to have_link(I18n.t(:your_dashboard)) }
  end
end
