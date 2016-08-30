shared_examples 'user not signed in' do
  it 'redirect from /dashboard to /sign_in' do
    visit(dashboard_path)
    expect(page).to have_current_path(sign_in_path)
  end
end
