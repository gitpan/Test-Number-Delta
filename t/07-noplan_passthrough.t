#!/usr/bin/perl
use strict;
use warnings;
use blib;  

# Test::Number::Delta  

use Test::Number::Delta 'no_plan';
delta_ok(1e-6, 2e-6, "foo");

