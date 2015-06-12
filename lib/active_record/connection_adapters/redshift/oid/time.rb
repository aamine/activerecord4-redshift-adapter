module ActiveRecord
  module ConnectionAdapters
    module Redshift
      module OID # :nodoc:
        class Time < Type::Time # :nodoc:
          include Infinity
        end
      end
    end
  end
end
