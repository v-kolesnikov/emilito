shared_examples 'user signed in' do
  it 'redirect from /sign_in to /dashboard' do
    visit(sign_in_path)
    expect(page).to have_current_path(dashboard_path)
  end
end
