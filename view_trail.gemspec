# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{view_trail}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Yoon"]
  s.date = %q{2009-08-14}
  s.description = %q{View trail tracks controller actions in Rails.}
  s.email = %q{yoon@northwestern.edu}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "features/step_definitions/view_trail_steps.rb",
     "features/step_definitions/webrat_steps.rb",
     "features/support/env.rb",
     "features/support/paths.rb",
     "features/view_trail.feature",
     "generators/view_trail/templates/create_activities_and_items.rb",
     "generators/view_trail/view_trail_generator.rb",
     "lib/view_trail.rb",
     "lib/view_trail/activity.rb",
     "lib/view_trail/activity_item.rb",
     "spec/spec_helper.rb",
     "spec/view_trail_spec.rb",
     "view_trail.gemspec"
  ]
  s.homepage = %q{http://github.com/yoon/view_trail}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{View trail tracks controller actions in Rails.}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/view_trail_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
