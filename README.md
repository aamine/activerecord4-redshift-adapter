activerecord4-redshift-adapter
==============================

Amazon Redshift adapter for ActiveRecord 4 (Rails 4).
Almost all code are copied from ActiveRecord 4 PostgreSQL
driver and modified for Redshift.

I know Redshift driver already exists (https://github.com/fiksu/activerecord-redshift-adapter),
but it supports only ActiveRecord 3.  Also, AR4 code is magnifically different
from AR3 code because of file separation, patching does not work well.
I want to use Rails 4 with Redshift NOW, so I created this repository.
If anybody write better Redshift driver for ActiveRecord 4, I abandon this driver.

How to Use
-------------------

In Gemfile
```
gem 'activerecord4-redshift-adapter', github: 'aamine/activerecord4-redshift-adapter'
```

In database.yml
```
development:
  adapter: redshift
  host: your_cluster_name.ident.ap-east-1.redshift.amazonaws.com
  database: dev
  port: 5439
  username: your_user
  password: your_password
  encoding: utf-8
  pool: 3
  timeout: 5000
```

License
---------

MIT license (same as ActiveRecord)
