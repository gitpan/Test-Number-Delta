use strict;
use Test::More tests => 10;

require_ok( "Test::Number::Delta" );

eval { Test::Number::Delta->import( within => 0.1, relative => 0.01 ) };
like( $@, "/Can't specify more than one of 'within' or 'relative'/", 
    "Import dies with both parameters" 
);

for my $p ( qw/within relative/ ) {
    eval { Test::Number::Delta->import( $p => -0.1 ) };
    like( $@, "/'$p' parameter must be positive/",
        "Import dies if '$p' parameter is negative" 
    );

    eval { Test::Number::Delta->import( $p => 0 ) };
    like( $@, "/'$p' parameter must be positive/",
        "Import dies if '$p' parameter is zero" 
    );
}

for my $w ( 0, -0.01 ) {
    eval { Test::Number::Delta::delta_within(0.1, 0.3, $w, "foo") };
    like( $@, "/Value of epsilon to delta_within must be positive/",
        "delta_within dies if epsilon is $w"
    );
    eval { Test::Number::Delta::delta_not_within(0.1, 0.3, $w, "foo") };
    like( $@, "/Value of epsilon to delta_not_within must be positive/",
        "delta_not_within dies if epsilon is $w"
    );
}
