module ActiveRecord
  module ConnectionAdapters
    class RedshiftColumn < Column #:nodoc:
      def initialize(name, default, cast_type, sql_type = nil, null = true, default_function = nil)
        super name, default, cast_type, sql_type, null
        @default_function = default_function
      end
    end
  end
end
