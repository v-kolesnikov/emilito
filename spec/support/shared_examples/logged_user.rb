shared_examples 'logged user' do
  context 'when go to /sign_in' do
    before { visit(sign_in_path) }
    it 'redirect to /dashboard' do
      expect(page).to have_current_path(dashboard_path)
    end
  end

  context 'main page' do
    before { visit(root_path) }
    it { expect(page).to have_link(I18n.t(:your_dashboard)) }
  end
end
