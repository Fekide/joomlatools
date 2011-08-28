require "nokogiri"

module Jdt

  class BadManifestException < RuntimeError
    attr_accessor :file, :schema, :errors

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

    attr_accessor :file, :errors

    def initialize(file)
      @file = file
      @errors = []
    end

    def validate
      read_xml
      validate_manifest
      validate_specific
    end

    private

    def read_xml
      @doc = Nokogiri::XML(File.read(file))
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

      if (not errors.empty?)
        error = BadManifestException.new(errors.join("\n"))
        error.file = file
        error.schema = schema
        error.errors = errors
        raise error
      end
    end

  end


end