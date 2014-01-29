Before do
  FileUtils.mkpath '/tmp/wow_repo'
end

After do
  FileUtils.remove_dir '/tmp/wow_repo', :force => true
end

Before '@gemspec' do
  f = File.open('/tmp/wow_repo/suchgem.gemspec', 'w')
  [
      "spec.name    'suchgem'",
      "spec.license 'MIT'"
  ].each do |line|
    f.write line
    f.write "\n"
  end
  f.close
end

Before '@no-remote' do
  Git.init '/tmp/not_wow'
end

After '@no-remote' do
#  FileUtils.remove_dir '/tmp/not_wow', :force => true
end
