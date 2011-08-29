require "nokogiri"

module Jdt

  class Manifest

    attr_accessor :errors, :warnings

    def valid?
      @errors = []
      @warnings = []
      syntax_valid? and semantics_valid?
    end

    private

    def syntax_valid?
      ManifestSchemaValidator.new(self).validate
    end

    def semantics_valid?
      
    end

  end

  class ManifestSchemaValidator

    SCHEMAS_FOLDER = "#{File.dirname(__FILE__)}/schemas"

    SCHEMAS = {:manifest => "#{SCHEMAS_FOLDER}/manifest.xsd",
               :library => "#{SCHEMAS_FOLDER}/library.xsd",
               :plugin => "#{SCHEMAS_FOLDER}/plugin.xsd",
               :module => "#{SCHEMAS_FOLDER}/module.xsd",
               :component => "#{SCHEMAS_FOLDER}/component.xsd",
               :template => "#{SCHEMAS_FOLDER}/template.xsd",
               :language => "#{SCHEMAS_FOLDER}/language.xsd",
               :package => "#{SCHEMAS_FOLDER}/package.xsd"}

    attr_accessor :manifest, :errors

    def initialize(manifest)
      @manifest = manifest
      @errors = []
    end

    def valid?
      read_xml
      validate_manifest and validate_specific
    end

    private

    def read_xml
      @doc = Nokogiri::XML(File.read(manifest))
    end

    def validate_manifest
      validate_against_schema(SCHEMAS[:manifest])
    end

    def validate_specific
      type = @doc.xpath("//extension").first['type']
      type_symbol = type.to_sym
      validate_against_schema(SCHEMAS[type_symbol])
    end

    def validate_against_schema(schema)
      xsd = Nokogiri::XML::Schema(File.read(schema))

      xsd.validate(@doc).each do |error|
        errors << error.message
      end

      errors.empty?
    end

  end

  class ManifestValidator

    attr_accessor :manifest, :errors, :warnings

    def initialize
      @errors = []
      @warnings = []
    end

    # Validates the manifest
    #
    # @return bool true if valid, false otherwise
    def valid?

      # ERROR when specified files and folders do not exist

      # ERROR when optional metadata field is missing (version, author, ...)
      # WARNING when metadata is missing

      # evaluate the validation result
      errors.empty?
    end

    def validate_file_existence(file)
      if (not File.exist?(file))
        errors << "File #{file} does not exist, but should"
      end
    end

    def validate_directory_existence(dir)
      if (not Dir.exist?(file))
        errors << "File #{file} does not exist, but should"
      end
    end

  end

end