#!/usr/bin/perl
use strict;
use warnings;
use blib;  

# Test::Number::Delta  

use Test::More tests => 2;

BEGIN { use_ok( 'Test::Number::Delta'); }
can_ok( 'Test::Number::Delta', qw( delta_ok delta_within ) ); 
