require 'support/matchers/be_success'

shared_examples 'create operation' do |concept|
  it "create a new #{concept}" do
    _, op = described_class.run(params)
    expect(op).to be_success
    expect(op.model.persisted?).to be
    expect(op.model).to be_kind_of concept
  end
end

shared_examples 'delete operation' do |concept|
  it "delete a exist #{concept}" do
    _, op = described_class.run(params)
    expect(op).to be_success
    expect(op.model.destroyed?).to be true
  end
end
