require "nokogiri"

module Jdt

  class Manifest

    attr_accessor :errors, :warnings

    def valid?
      syntax_valid? and semantics_valid?
    end

    def errors
      @errors ||= []
    end

    def warnings
      @warnings ||= []
    end

    private

    def syntax_valid?
      ManifestSchemaValidator.new(self).valid?
    end

    def semantics_valid?
      # todo change this
      true
    end

  end

  class ManifestSchemaValidator

    SCHEMAS_FOLDER = "#{File.dirname(__FILE__)}/schemas"

    # TODO create schemas for all different extensions and check that the validation works as expected
    SCHEMAS = {:manifest => "#{SCHEMAS_FOLDER}/manifest.xsd",
               :library => "#{SCHEMAS_FOLDER}/library.xsd",
               :plugin => "#{SCHEMAS_FOLDER}/plugin.xsd",
               :module => "#{SCHEMAS_FOLDER}/module.xsd",
               :component => "#{SCHEMAS_FOLDER}/component.xsd",
               :template => "#{SCHEMAS_FOLDER}/template.xsd",
               :language => "#{SCHEMAS_FOLDER}/language.xsd",
               :package => "#{SCHEMAS_FOLDER}/package.xsd"}

    attr_accessor :manifest

    def initialize(manifest)
      @manifest = manifest
    end

    def valid?
      validate_manifest and validate_specific
    end

    private

    def validate_manifest
      validate_against_schema(SCHEMAS[:manifest])
    end

    def validate_specific
      validate_against_schema(SCHEMAS[manifest.ext_type.to_sym])
    end

    def validate_against_schema(schema)
      xsd = Nokogiri::XML::Schema(File.read(schema))

      xsd.validate(manifest.doc).each do |error|
        @manifest.errors << error.message
      end

      @manifest.errors.empty?
    end

  end

  class ManifestValidator

    attr_accessor :manifest

    def initialize(manifest)
      @manifest = manifest
    end

    # Validates the manifest
    #
    # @return bool true if valid, false otherwise
    def valid?

      # ERROR when specified files and folders do not exist

      # ERROR when optional metadata field is missing (version, author, ...)
      # WARNING when metadata is missing

      # evaluate the validation result
      @manifest.errors.empty?
    end

    def validate_file_existence(file)
      if (not File.exist?(file))
        manifest.errors << "File #{file} does not exist, but should"
      end
    end

    def validate_directory_existence(dir)
      if (not Dir.exist?(file))
        manifest.errors << "File #{file} does not exist, but should"
      end
    end

  end

end