use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new
    ( module_name     => 'Test::Number::Delta',
      create_makefile_pl => "traditional",
      create_readme => 1,
      license         => 'perl',
      requires => {
          perl => 5.004,
          Test::Builder => 0.3, # (0.11 since perl 5.007003, 0.3 is new)
          # build requires here
          Test::Builder::Tester => 1.01,
          Test::Exception => 0.20,
          Test::More => 0.47,
      },
      build_requires => {
      },
	)->create_build_script;
