RSpec::Matchers.define :be_success do |_expected|
  match(&:valid?)

  failure_message do |actual|
    actual.contract.errors.messages
  end
end

RSpec::Matchers.define :be_fail_with_key do |expected|
  match do |actual|
    actual.contract.errors.messages.key? expected
  end

  failure_message do |actual|
    "#{actual.contract.errors} not be include error with key #{expected}"
  end
end

RSpec::Matchers.define :be_fail_with_keys do |expected|
  match do |actual|
    expected.all? { |key| actual.contract.errors.messages.key? key }
  end

  failure_message do |actual|
    messages = actual.contract.errors.messages
    "#{messages} not be include errors with keys #{expected}"
  end
end
