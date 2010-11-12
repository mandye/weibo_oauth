# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{kmt_oauth}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Richard Taylor"]
  s.date = %q{2010-06-13}
  s.description = %q{kmt_oauth is a Ruby library for talking to t.sina using the new oauth method.}
  s.email = %q{panfu.gz@gmail.com}
  s.files = ["LICENSE", "README.textile","lib/kmt_oauth.rb"] + Dir.glob('lib/kmt_oauth/*.rb')
  s.has_rdoc = false
  s.homepage = %q{http://github.com/panfu/kmt_oauth}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{kmt_oauth}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{kmt_oauth is a Ruby library for talking to t.sina using the new oauth method.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, [">= 0.3.6"])
      s.add_runtime_dependency(%q<json>, [">= 1.1.9"])
      s.add_runtime_dependency(%q<mime-types>, [">= 1.16"])
      %w(shoulda mocha).each do |dep|
        s.add_development_dependency dep
      end
    else
      s.add_dependency(%q<oauth>, [">= 0.3.6"])
      s.add_dependency(%q<json>, [">= 1.1.9"])
      s.add_dependency(%q<mime-types>, [">= 1.16"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0.3.6"])
    s.add_dependency(%q<json>, [">= 1.1.9"])
    s.add_dependency(%q<mime-types>, [">= 1.16"])
  end
end
