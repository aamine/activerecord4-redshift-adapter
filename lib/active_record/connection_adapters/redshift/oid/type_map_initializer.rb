module ActiveRecord
  module ConnectionAdapters
    module Redshift
      module OID # :nodoc:
        # This class uses the data from PostgreSQL pg_type table to build
        # the OID -> Type mapping.
        #   - OID is an integer representing the type.
        #   - Type is an OID::Type object.
        # This class has side effects on the +store+ passed during initialization.
        class TypeMapInitializer # :nodoc:
          def initialize(store)
            @store = store
          end

          def run(records)
            nodes = records.reject { |row| @store.key? row['oid'].to_i }
            mapped, nodes = nodes.partition { |row| @store.key? row['typname'] }
            ranges, nodes = nodes.partition { |row| row['typtype'] == 'r'.freeze }
            enums, nodes = nodes.partition { |row| row['typtype'] == 'e'.freeze }
            domains, nodes = nodes.partition { |row| row['typtype'] == 'd'.freeze }
            arrays, nodes = nodes.partition { |row| row['typinput'] == 'array_in'.freeze }
            composites, nodes = nodes.partition { |row| row['typelem'].to_i != 0 }

            mapped.each     { |row| register_mapped_type(row)    }
          end

          private

          def register_mapped_type(row)
            alias_type row['oid'], row['typname']
          end

          def register(oid, oid_type = nil, &block)
            oid = assert_valid_registration(oid, oid_type || block)
            if block_given?
              @store.register_type(oid, &block)
            else
              @store.register_type(oid, oid_type)
            end
          end

          def alias_type(oid, target)
            oid = assert_valid_registration(oid, target)
            @store.alias_type(oid, target)
          end

          def register_with_subtype(oid, target_oid)
            if @store.key?(target_oid)
              register(oid) do |_, *args|
                yield @store.lookup(target_oid, *args)
              end
            end
          end

          def assert_valid_registration(oid, oid_type)
            raise ArgumentError, "can't register nil type for OID #{oid}" if oid_type.nil?
            oid.to_i
          end
        end
      end
    end
  end
end
