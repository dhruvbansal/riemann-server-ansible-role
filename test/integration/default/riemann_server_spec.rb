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
  its('group') { should eq 'riemann' }
  its('shell') { should eq '/bin/false' }
  its('home') { should eq '/usr/share/riemann' }
end

describe file('/etc/logstash/conf.d') do
  it { should_not exist }
end

riemann_directories = %w(
  /usr/share/riemann
  /etc/riemann
  /var/log/riemann
)
riemann_directories.each do |dir|
  describe file(dir) do
    it { should exist }
    it { should be_directory }
  end
end

describe file('/etc/riemann/riemann.config') do
  it { should exist }
  its('owner') { should eq "root" }
  its('group') { should eq "root" }
  its('mode') { should eq 0644 }

  its('content') { should match "(tcp-server {:host host :port 5555})" }
end
