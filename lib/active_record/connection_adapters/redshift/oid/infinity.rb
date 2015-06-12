module ActiveRecord
  module ConnectionAdapters
    module Redshift
      module OID # :nodoc:
        module Infinity # :nodoc:
          def infinity(options = {})
            options[:negative] ? -::Float::INFINITY : ::Float::INFINITY
          end
        end
      end
    end
  end
end
