use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new
    ( module_name     => 'Test::Number::Delta',
      create_makefile_pl => "passthrough",
      license         => 'perl',
	  requires        => {
                           Test::Builder => 0.22,
	                     },
	  build_requires  => { 
                           Test::Builder::Tester => 1.01,
	                       Test::More => 0.53,
	                     },
	)->create_build_script;
