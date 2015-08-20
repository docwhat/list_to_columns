require 'yaml'

# Monkey patch the version number.
module ListToColumns
  VERSION ||= begin
              semver = YAML.load File.read(File.expand_path('../../../.semver', __FILE__))
              [semver[:major], semver[:minor], semver[:patch]].join('.')
            end
end
