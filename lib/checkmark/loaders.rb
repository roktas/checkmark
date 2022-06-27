# frozen_string_literal: true

class Checkmark
  class Loader
    attr_reader :content, :reader, :settings

    def initialize(content, reader, **settings)
      @content  = content
      @reader   = reader
      @settings = settings
    end

    def self.load_file(file, reader = nil, **settings)
      content = Content.(File.read(file), Support.extname!(file).to_sym, origin: file)
      new content, reader, **settings
    end

    require_relative 'loaders/bank'
    require_relative 'loaders/coll'
    require_relative 'loaders/item'
  end
end