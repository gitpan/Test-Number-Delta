#!/usr/bin/perl
use strict;
use warnings;
use blib;  

# Test::Number::Delta  

use Test::Number::Delta within => 1e-4, tests => 1;
delta_ok(1e-4, 2e-4, "foo");

