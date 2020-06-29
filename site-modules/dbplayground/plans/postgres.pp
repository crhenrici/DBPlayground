plan dbplayground::postgres (
     TargetSpec $targets
   ) {
     $targets.apply_prep
     apply($targets) {
	class { 'postgresql::server':
  ip_mask_deny_postgres_user => '0.0.0.0/32',
  ip_mask_allow_all_users    => '0.0.0.0/0',
  ipv4acls                   => ['hostssl all johndoe 192.168.0.0/24 cert'],
  postgres_password          => 'cre123',
}
        }

   }
