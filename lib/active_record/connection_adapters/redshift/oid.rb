require 'active_record/connection_adapters/redshift/oid/infinity'

require 'active_record/connection_adapters/redshift/oid/date'
require 'active_record/connection_adapters/redshift/oid/date_time'
require 'active_record/connection_adapters/redshift/oid/decimal'
require 'active_record/connection_adapters/redshift/oid/float'
require 'active_record/connection_adapters/redshift/oid/integer'
require 'active_record/connection_adapters/redshift/oid/json'
require 'active_record/connection_adapters/redshift/oid/jsonb'
require 'active_record/connection_adapters/redshift/oid/time'

require 'active_record/connection_adapters/redshift/oid/type_map_initializer'

module ActiveRecord
  module ConnectionAdapters
    module Redshift
      module OID # :nodoc:
      end
    end
  end
end
