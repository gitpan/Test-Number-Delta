use strict;

use Test::Builder::Tester tests => 4;
use Test::Number::Delta;

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("0.0000100 and 0.0000200 are not equal to within 0.000001");
delta_ok(1e-5, 2e-5, "foo");
test_test("delta_ok fail works");

test_out("ok 1 - foo");
delta_ok(1e-6, 2e-6, "foo");
test_test("delta_ok ok works");

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("0.00100 and 0.00200 are not equal to within 0.0001");
delta_within(1e-3, 2e-3, 1e-4, "foo");
test_test("delta_within fail works");

test_out("ok 1 - foo");
delta_within(1e-4, 2e-4, 1e-4, "foo");
test_test("delta_within ok works");

