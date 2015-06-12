module ActiveRecord
  module ConnectionAdapters
    module Redshift
      module ReferentialIntegrity # :nodoc:
        def supports_disable_referential_integrity? # :nodoc:
          true
        end

        def disable_referential_integrity # :nodoc:
          yield
        end
      end
    end
  end
end
