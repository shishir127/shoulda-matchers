require_relative 'support/unit/load_environment'

require 'rspec/rails'
require 'shoulda-matchers'

require 'spec_helper'

Dir[ File.join(File.expand_path('../support/unit/**/*.rb', __FILE__)) ].sort.each do |file|
  require file
end

RSpec.configure do |config|
  if config.respond_to?(:infer_spec_type_from_file_location!)
    config.infer_spec_type_from_file_location!
  end

  config.before(:all, type: :controller) do
    self.class.controller(ApplicationController) { }
  end

  UnitTests::ActiveModelHelpers.configure_example_group(config)
  UnitTests::ActiveModelVersions.configure_example_group(config)
  UnitTests::ActiveResourceBuilder.configure_example_group(config)
  UnitTests::ClassBuilder.configure_example_group(config)
  UnitTests::ControllerBuilder.configure_example_group(config)
  UnitTests::I18nFaker.configure_example_group(config)
  UnitTests::MailerBuilder.configure_example_group(config)
  UnitTests::ModelBuilder.configure_example_group(config)
  UnitTests::RailsVersions.configure_example_group(config)
  UnitTests::ActiveRecordVersions.configure_example_group(config)
  UnitTests::ActiveModelVersions.configure_example_group(config)
  UnitTests::DatabaseHelpers.configure_example_group(config)
  UnitTests::ColumnTypeHelpers.configure_example_group(config)

  config.include UnitTests::Matchers
end

ActiveSupport::Deprecation.behavior = :stderr

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
