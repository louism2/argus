module Argus

  class NavOption
    attr_reader :tag

    def initialize(data)
      @tag, @size = data.unpack("vv")
    end

    def size
      @size < 4 ? 4 : @size
    end

    def self.options
      @options ||= { }
    end

    def self.register(option)
      options[option.tag] = option
    end

    def self.parse(raw_data)
      tag = raw_data.unpack("v").first
      option = options[tag] || NavOptionUnknown
      option.new(raw_data)
    end
  end

end
