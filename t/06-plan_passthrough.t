#!/usr/bin/perl
use strict;
use warnings;
use blib;  

# Test::Number::Delta  

use Test::Number::Delta tests => 1;
delta_ok(1e-6, 2e-6, "foo");

