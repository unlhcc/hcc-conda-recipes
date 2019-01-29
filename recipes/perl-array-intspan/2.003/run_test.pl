#  tests for perl-array-intspan-2.003-pl526_0 (this is a generated file);
print('===== testing package: perl-array-intspan-2.003-pl526_0 =====');
print('running run_test.pl');

#  --- run_test.pl (begin) ---
my $expected_version = "2.003";
print("import: Array::IntSpan\n");
use Array::IntSpan;

if (defined Array::IntSpan->VERSION) {
	my $given_version = Array::IntSpan->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Array::IntSpan->VERSION . '
');

}

my $expected_version = "2.002";
print("import: Array::IntSpan::Fields\n");
use Array::IntSpan::Fields;

if (defined Array::IntSpan::Fields->VERSION) {
	my $given_version = Array::IntSpan::Fields->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Array::IntSpan::Fields->VERSION . '
');

}

my $expected_version = "1.01";
print("import: Array::IntSpan::IP\n");
use Array::IntSpan::IP;

if (defined Array::IntSpan::IP->VERSION) {
	my $given_version = Array::IntSpan::IP->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Array::IntSpan::IP->VERSION . '
');

}

print('===== perl-array-intspan-2.003-pl526_0 OK =====');
