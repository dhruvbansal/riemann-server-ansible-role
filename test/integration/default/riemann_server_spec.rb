# use basic tests
describe package('riemann') do
  it { should be_installed }
end

describe service('riemann') do
  it { should be_enabled }
  it { should be_installed }
end

describe user('riemann') do
  it { should exist }
end
