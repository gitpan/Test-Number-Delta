use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new
    ( module_name     => 'Test::Number::Delta',
      create_makefile_pl => "passthrough",
      license         => 'perl',
      requires => {
          perl => 5.004,
          Test::Builder => 0.22,
      },
      build_requires => {
          Test::Builder::Tester => 1.01,
          Test::Exception => 0.19,
          Test::More => 0.54, 
      },
	)->create_build_script;
