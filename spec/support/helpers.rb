module Helpers

  def yaml_fixtures
    fixtures = {}
    Dir[Rails.root.join("spec/support/**/*.yml")].each do |f|
      fixtures[File.basename(f, ".yml")] = YAML.load(File.open(f).read)
    end
    fixtures
  end
  
end