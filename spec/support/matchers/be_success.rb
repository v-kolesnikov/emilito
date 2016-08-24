RSpec::Matchers.define :be_success do |expected|
  match do |actual|
    actual.valid?
  end
  failure_message do |actual|
    actual.contract.errors
  end
end
