use strict;

use Test::Builder::Tester tests => 6;
use Test::Number::Delta relative => 1e-2;

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("0.001000 and 0.000980 are not equal to within 0.00001");
delta_ok(1e-3, 9.8e-4, "foo");
test_test("fail works");

test_out("not ok 1 - foo");
test_fail(+2);
test_diag("-50.00 and -49.40 are not equal to within 0.5");
delta_ok(-50, -49.4, "foo");
test_test("fail works");

test_out("ok 1 - foo");
delta_ok(10e-5, 9.91e-5, "foo");
test_test("ok works");

test_out("ok 1 - foo");
delta_ok(-9.91e-5, -10e-5, "foo");
test_test("ok works");

test_out("ok 1 - foo");
delta_ok(1.01, 1.0099, "foo");
test_test("ok works");

test_out("ok 1 - foo");
delta_ok(-100, -99.1, "foo");
test_test("ok works");


