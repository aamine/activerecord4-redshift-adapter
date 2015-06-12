activerecord4-redshift-adapter
==============================

Amazon Redshift adapter for ActiveRecord 4 (Rails 4).
I copied PostgreSQL driver from ActiveRecord 4.0.0 and modified for Redshift.
"Barely works" patch was borrowed from fiksu/activerecord-redshift-adapter.

I know Redshift driver already exists (https://github.com/fiksu/activerecord-redshift-adapter),
but it currently supports only ActiveRecord 3.  Also, AR4 code is magnifically
different from AR3 code because of file separation, patching does not work well.
I want to use Rails 4 with Redshift NOW, so I wrote this driver.
If anybody write better Redshift driver which works with ActiveRecord 4,
I abandon this driver.

Supported Version
-------------------

- Version 0.2.x supports ActiveRecord (Rails) 4.2.
- Version 0.1.x supports ActiveRecord (Rails) 4.1.


Usage
-------------------

In Gemfile
```
gem 'activerecord4-redshift-adapter', '~> 0.2.0'
```

In database.yml
```
development:
  adapter: redshift
  host: your_cluster_name.hashhash.ap-northeast-1.redshift.amazonaws.com
  port: 5439
  database: dev
  username: your_user
  password: your_password
  encoding: utf8
  pool: 3
  timeout: 5000
```

License
---------

MIT license (same as ActiveRecord)
