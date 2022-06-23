# frozen_string_literal: true

class Checkmark
  module Publish
    Base = Extension[self] do
      def publish(_outfile, _bank)
        raise NotImplementedError
      end

      def accepts
        raise NotImplementedError
      end

      def favour
        accepts.first
      end

      def accepted?(type)
        accepts.include? type.to_sym
      end

      def accepted!(bank)
        raise Error, "Content type must be one of #{accepts}" unless accepted?(bank.type)
      end
    end

    require_relative 'publish/html'
    require_relative 'publish/pdf'
  end
end
