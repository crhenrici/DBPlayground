plan dbplayground::postgres (
     TargetSpec $targets
   ) {
     $targets.apply_prep
     apply($targets) {
	class { 'postgresql::server':
		postgres_password          => 'test123',
}
        }

   }
