module ActiveRecord
  module ConnectionAdapters
    module Redshift
      module OID # :nodoc:
        class Integer < Type::Integer # :nodoc:
          include Infinity
        end
      end
    end
  end
end
