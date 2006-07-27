use strict;

use Test::Builder::Tester tests => 11;
use Test::Number::Delta;

#--------------------------------------------------------------------------#
# scalar
#--------------------------------------------------------------------------#

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("0.0000100 and 0.0000200 are not equal to within 0.000001");
delta_ok(1e-5, 2e-5, "foo");
test_test("delta_ok(\$a,\$b) fail works");

test_out("ok 1 - foo");
delta_ok(1.1e-6, 2e-6, "foo");
test_test("delta_ok(\$a,\$b) pass works");

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("0.00100 and 0.00200 are not equal to within 0.0001");
delta_within(1e-3, 2e-3, 1e-4, "foo");
test_test("delta_within(\$a,\$b,\$e) fail works");

test_out("ok 1 - foo");
delta_within(1.1e-4, 2e-4, 1e-4, "foo");
test_test("delta_within(\$a,\$b,\$e) pass works");

#--------------------------------------------------------------------------#
# list
#--------------------------------------------------------------------------#

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("Got an array of length 2, but expected an array of length 1");
delta_ok( [1e-5, 2e-5], [1e-5], "foo");
test_test("delta_ok(\\\@a,\\\@b) unequal length fail works");

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("At [1]: 0.0000200 and 0.0000300 are not equal to within 0.000001");
delta_ok( [1e-5, 2e-5], [1e-5, 3e-5], "foo");
test_test("delta_ok(\\\@a,\\\@b) pairwise fail works");

test_out("ok 1 - foo");
delta_ok( [1e-5, 2e-5], [1e-5, 2e-5], "foo");
test_test("delta_ok(\\\@a,\\\@b) pairwise pass works");

test_out("ok 1 - foo");
delta_ok( [[1e-5, 2e-5], [3e-5, 4e-5]], [[1e-5, 2e-5], [3e-5, 4e-5]], "foo");
test_test("delta_ok(\\\@a,\\\@b) matrix pass works");

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("At [1][0]: 0.0000300 and 0.0000100 are not equal to within 0.000001");
delta_ok( [[1e-5, 2e-5], [3e-5, 4e-5]], [[1e-5, 2e-5], [1e-5, 4e-5]], "foo");
test_test("delta_ok(\\\@a,\\\@b) matrix fail works");

test_out("ok 1 - foo");
delta_within( [[1e-3, 2e-3], [3e-3, 4e-3]], [[1e-3, 2e-3], [3e-3, 4e-3]], 1e-4, "foo");
test_test("delta_within(\\\@a,\\\@b,\$e) matrix pass works");

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("At [1][0]: 0.00300 and 0.00100 are not equal to within 0.0001");
delta_within( [[1e-3, 2e-3], [3e-3, 4e-3]], [[1e-3, 2e-3], [1e-3, 4e-3]], 1e-4, "foo");
test_test("delta_within(\\\@a,\\\@b,\$e) matrix fail works");

