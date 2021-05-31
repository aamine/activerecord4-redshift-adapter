module ActiveRecord
  module ConnectionAdapters
    class RedshiftColumn < Column #:nodoc:
      attr_reader :sortkey, :distkey

      def initialize(name, default, cast_type, sql_type = nil, null = true, default_function = nil, sortkey = false, distkey = false)
        super name, default, cast_type, sql_type, null
        @default_function = default_function
        @sortkey = sortkey
        @distkey = distkey
      end
    end
  end
end
