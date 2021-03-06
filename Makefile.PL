
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.025.
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.17;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Compare the difference between numbers against a given tolerance",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Test-Number-Delta",
  "EXE_FILES" => [],
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.006",
  "NAME" => "Test::Number::Delta",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => 0,
    "Test::Builder" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "Test::Builder::Tester" => "1.02",
    "Test::More" => 0
  },
  "VERSION" => "1.06",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Exporter" => 0,
  "ExtUtils::MakeMaker" => "6.17",
  "File::Spec" => 0,
  "Test::Builder" => 0,
  "Test::Builder::Tester" => "1.02",
  "Test::More" => 0,
  "strict" => 0,
  "vars" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



