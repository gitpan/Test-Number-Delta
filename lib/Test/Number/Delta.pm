package Test::Number::Delta;
use 5.004;
use strict;
#use warnings; bah -- not supported before 5.006

use vars qw ($VERSION @EXPORT @ISA);
$VERSION = "0.12";

# Required modules
use Carp;
use Test::Builder;
use Exporter;

@ISA = qw( Exporter );
@EXPORT = qw( delta_ok delta_within );

#--------------------------------------------------------------------------#
# main pod documentation #####
#--------------------------------------------------------------------------#

=head1 NAME

Test::Number::Delta - Compare if the difference between two numbers 
is within a specified precision

=head1 SYNOPSIS

  # Default precision
  use Test::Number::Delta;
  delta_ok( 1e-5, 2e-5, 'values within 1e-6'); # not ok
  
  # Specific precision for a single test
  delta_within( 1e-3, 2e-3, 1e-4, 'values within 1e-4'); not ok
  
  # Set a different default precision
  use Test::Number::Delta within => 1e-5;
  delta_ok( 1e-5, 2e-5, 'values within 1e-5'); # ok

  
=head1 DESCRIPTION

Most programmers at one time or another are confronted with the 
issue of comparing floating-point numbers for equality.  The 
canonical idiom is to test if the absolute value of the difference
of the numbers is within a desired precision.  This module provides 
such a function for use with L<Test::Harness>.  Usage is similar 
to other test functions described in L<Test::More>.  Semantically,
the C<delta_within> function replaces this kind of construct:

 ok ( abs($p - $q) <= $precision, '$p is equal to $q' ) or
     diag "$p is not equal to $q to within $precision";

While there's nothing wrong with that construct, it's a pain to 
type it repeatedly in a test script.  This module does the same thing
with a single function call.  The C<delta_ok> function is similar,
but uses a global default precision so even the precision need not
be specified repeatedly.  Both functions are exported automatically.

=head1 USAGE

=head2 Setting the default precision

By default, C<use Test::Number::Delta> will compare equality with a precision
of 1e-6.  (An arbitrary choice on my part.)  To specific a different precision,
provide a C<within> parameter when importing the module with C<use>:

 use Test::Number::Delta within => 1e-9;


=cut 

my $Test = Test::Builder->new;
my $Precision = 1e-6;

sub import {
    my($self, %args) = @_;
    my $pack = caller;
    if (exists $args{within}) {
        $Precision = $args{within};
    }
    
    $Test->exported_to($pack);
    $self->export_to_level(1, $self, 'delta_ok');
    $self->export_to_level(1, $self, 'delta_within');
}


#--------------------------------------------------------------------------#
# delta_within()
#

=head2 delta_within
 
 delta_within( $p, $q, $prec, '$p and $q are equal within $prec' );

This test compares equality within a given precision.  The test is true if the
absolute value of the difference between $p and $q is B<less than or equal to>
the precision.  If the test is true, it prints an "OK" statement for use in
testing.  If the test is not true, this function prints a failure report and
diagnostic.

=cut

sub delta_within($$$;$) {
	my ($p, $q, $prec, $name) = @_;
    my $delta_prec = -log($prec)/log(10);
    my $in_prec = $delta_prec + 1;
    return $Test->ok(abs($p - $q) <= $prec,$name) || $Test->diag(
        sprintf("%.${in_prec}f and %.${in_prec}f are not equal to within %.${delta_prec}f",
                $p, $q, $prec));
}

#--------------------------------------------------------------------------#
# delta_ok()
#

=head2 delta_ok
 
 delta_ok( $p, $q, '$p and $q are equal' );

This test compares equality within the default precision specified during
import (or the default of 1e-6).  The test is true if the absolute value
of the difference between $p and $q is B<less than or equal to> the default
precision.  If the test is true, it prints an "OK" statement for use
in testing.  If the test is not true, this function prints a failure report 
and diagnostic.

=cut

sub delta_ok($$;$) {
	my ($p, $q, $name) = @_;
    {
        local $Test::Builder::Level = 2;
        delta_within( $p, $q, $Precision, $name );
    }
}


1; #this line is important and will help the module return a true value
__END__

=head1 BUGS

Please report bugs using the CPAN Request Tracker at 
http://rt.cpan.org/NoAuth/Bugs.html?Dist=Test-Number-Delta

=head1 AUTHOR

David A Golden <dagolden@cpan.org>

http://dagolden.com/

=head1 COPYRIGHT

Copyright (c) 2005 by David A. Golden

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

L<Test::More>, L<Test::Harness>, L<Test::Builder>

=cut
