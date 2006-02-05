use strict;
use Test::More tests=>2;

require_ok( "Test::Number::Delta" );

eval { Test::Number::Delta->import( within => 0.1, relative => 0.01 ) };
ok( $@, "Dies with both parameters" );

