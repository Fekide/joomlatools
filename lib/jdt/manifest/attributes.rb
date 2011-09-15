require "nokogiri"

module Jdt

  class ElementNotFoundError < RuntimeError
    # TODO handle the part, when the element has not been found as it was optional, how is this handled by the accessors of the attributes?
  end

  class Manifest

    def required_joomla_version
      @doc.xpath("//extension").first['version']
    end

    def ext_method
      @doc.xpath("//extension").first['method']
    end

    def author
      @doc.xpath("//extension/author").text
    end

    def author_email
      @doc.xpath("//extension/authorEmail").text
    end

    def author_url
      @doc.xpath("//extension/authorUrl").text
    end

    def creation_date
      @doc.xpath("//extension/creationDate").text
    end

    def name
      @doc.xpath("//extension/name").text
    end

    def prefixed_name
      "#{ext_type_short}_#{name}"
    end

    def prefixed_name_with_version
      "#{prefixed_name}-v#{version}"
    end

    def description
      @doc.xpath("//extension/description").text
    end

    def version
      @doc.xpath("//extension/version").text
    end

    def homepage
      @doc.xpath("//extension/homepage").text
    end

    def copyright
      @doc.xpath("//extension/copyright").text
    end

    def license
      @doc.xpath("//extension/license").text
    end

    def ext_type_short
      raise NoMethodError
    end

    def ext_type
      @doc.xpath("//extension").first['type']
    end

  end

end