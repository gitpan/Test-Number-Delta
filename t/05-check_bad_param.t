#!/usr/bin/perl
use strict;
use warnings;
use blib;  

# Test::Number::Delta  

use Test::Exception tests => 1;

require Test::Number::Delta;
dies_ok { Test::Number::Delta->import( within => 0.1, relative => 0.01 )}
    "Dies with both parameters";

