plan dbplay::postgres(
  TargetSpec $targets
) {
  $targets.apply_prep
  apply($targets) {
    class { 'postgresql::server':
      ip_mask_allow_all_users    => '172.16.0.0/16',
      postgres_password => 'test123',
    }
  }
}
