# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hoptoad-notifier-client}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wes Maldonado (code)", "Martin Luder (rubygem)"]
  s.email = %q{wes@brokenbuild.com},
  s.date = %q{2009-06-25}
  s.extra_rdoc_files = [
    "README.txt"
  ]
  s.files = [
    "History.txt",
    "Manifest.txt",
    "README.txt",
    "Rakefile",
    "VERSION.yml",
    "lib/hoptoad_notifier_client.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/wesmaldonado/hoptoad-notifier-client/tree/master}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Simple class that sends data to Hoptoad using HTTParty}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
  end
end
