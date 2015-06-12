module ActiveRecord
  module ConnectionAdapters
    module Redshift
      module OID # :nodoc:
        class Date < Type::Date # :nodoc:
          include Infinity
        end
      end
    end
  end
end
