my $expected_version = "0.31";
print("import: Sort::MergeSort\n");
use Sort::MergeSort;

if (defined Sort::MergeSort->VERSION) {
	my $given_version = Sort::MergeSort->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Sort::MergeSort->VERSION . '
');

}

my $expected_version = "0.01";
print("import: Sort::MergeSort::Iterator\n");
use Sort::MergeSort::Iterator;

if (defined Sort::MergeSort::Iterator->VERSION) {
	my $given_version = Sort::MergeSort::Iterator->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Sort::MergeSort::Iterator->VERSION . '
');

}
