module ActiveRecord
  module ConnectionAdapters
    module Redshift
      module ColumnMethods
        def json(name, options = {})
          column(name, :json, options)
        end

        def jsonb(name, options = {})
          column(name, :jsonb, options)
        end
      end

      class ColumnDefinition < Struct.new(*ActiveRecord::ConnectionAdapters::ColumnDefinition.members, :sortkey, :distkey)
        def primary_key?
          primary_key || type.to_sym == :primary_key
        end
      end

      class TableDefinition < ActiveRecord::ConnectionAdapters::TableDefinition
        include ColumnMethods

        # Defines the primary key field.
        # Use of the native PostgreSQL UUID type is supported, and can be used
        # by defining your tables as such:
        #
        #   create_table :stuffs, id: :uuid do |t|
        #     t.string :content
        #     t.timestamps
        #   end
        #
        # By default, this will use the +uuid_generate_v4()+ function from the
        # +uuid-ossp+ extension, which MUST be enabled on your database. To enable
        # the +uuid-ossp+ extension, you can use the +enable_extension+ method in your
        # migrations. To use a UUID primary key without +uuid-ossp+ enabled, you can
        # set the +:default+ option to +nil+:
        #
        #   create_table :stuffs, id: false do |t|
        #     t.primary_key :id, :uuid, default: nil
        #     t.uuid :foo_id
        #     t.timestamps
        #   end
        #
        # You may also pass a different UUID generation function from +uuid-ossp+
        # or another library.
        #
        # Note that setting the UUID primary key default value to +nil+ will
        # require you to assure that you always provide a UUID value before saving
        # a record (as primary keys cannot be +nil+). This might be done via the
        # +SecureRandom.uuid+ method and a +before_save+ callback, for instance.
        def primary_key(name, type = :primary_key, options = {})
          return super unless type == :uuid
          options[:default] = options.fetch(:default, 'uuid_generate_v4()')
          options[:primary_key] = true
          column name, type, options
        end

        def new_column_definition(name, type, options) # :nodoc:
          column = super
          column.sortkey = options[:sortkey]
          column.distkey = options[:distkey]
          column
        end

        private

          def create_column_definition(name, type)
            Redshift::ColumnDefinition.new name, type
          end
      end

      class Table < ActiveRecord::ConnectionAdapters::Table
        include ColumnMethods
      end
    end
  end
end
