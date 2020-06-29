# This file was automatically generated on 2020-06-29 20:01:47 +0200.
# Use the 'puppet generate types' command to regenerate this file.

# @summary Manages Postgresql replication slots.
# 
# This type allows to create and destroy replication slots
# to register warm standby replication on a Postgresql
# master server.
Puppet::Resource::ResourceType3.new(
  'postgresql_replication_slot',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # The name of the slot to create. Must be a valid replication slot name.
    # 
    # Values can match `/^[a-z0-9_]+$/`.
    Puppet::Resource::Param(Pattern[/^[a-z0-9_]+$/], 'name', true),

    # The specific backend to use for this `postgresql_replication_slot`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # ruby
    # : For confinement
    # 
    #   * Required binaries: `psql`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
