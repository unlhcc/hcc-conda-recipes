my $expected_version = "1.33";
print("import: Sort::Key\n");
use Sort::Key;
if (defined Sort::Key->VERSION) {
	my $given_version = Sort::Key->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Sort::Key->VERSION . '
');

}

my $expected_version = "1.3";
print("import: Sort::Key::Multi\n");
use Sort::Key::Multi;
if (defined Sort::Key::Multi->VERSION) {
	my $given_version = Sort::Key::Multi->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Sort::Key::Multi->VERSION . '
');

}

my $expected_version = "0.04";
print("import: Sort::Key::Natural\n");
use Sort::Key::Natural;
if (defined Sort::Key::Natural->VERSION) {
	my $given_version = Sort::Key::Natural->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Sort::Key::Natural->VERSION . '
');

}

my $expected_version = "1.3";
print("import: Sort::Key::Types\n");
use Sort::Key::Types;
if (defined Sort::Key::Types->VERSION) {
	my $given_version = Sort::Key::Types->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Sort::Key::Types->VERSION . '
');

}

my $expected_version = "0.02";
print("import: Sort::Key::Maker\n");
use Sort::Key::Maker bar_sort => qw(int int str);
if (defined Sort::Key::Maker->VERSION) {
	my $given_version = Sort::Key::Maker->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Sort::Key::Maker->VERSION . '
');

}

my $expected_version = "1.3";
print("import: Sort::Key::Register\n");
use Sort::Key::Register 'MyPkg::foo' => sub { $_ }, '-int';
if (defined Sort::Key::Register->VERSION) {
	my $given_version = Sort::Key::Register->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Sort::Key::Register->VERSION . '
');

}
