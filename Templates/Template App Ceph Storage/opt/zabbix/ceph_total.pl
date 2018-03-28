#!/usr/bin/perl
use strict;
use warnings;
use JSON qw( decode_json encode_json );

my %output;
my $part = $ARGV[0];

$output{'data'} = [];

my $json = `ceph df -f json`;
my $decoded = decode_json($json);
my @pools = @{ $decoded->{'pools'} };

print $decoded->{'stats'}{$part};
exit 0;

