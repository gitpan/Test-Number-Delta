#!/usr/bin/perl
use strict;
use warnings;
use blib;  

# Test::Number::Delta  
use Test::Exception tests => 1;
require Test::Number::Delta;
dies_ok { Test::Number::Delta->import(tests => 1, within => 1e-4) }
    "dies if parameter is given after test plan";

