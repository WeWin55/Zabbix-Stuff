#!/usr/bin/perl
use strict;
use warnings;
use JSON qw( decode_json encode_json );

my %output;

$output{'data'} = [];

my $json = `ceph df -f json`;
my $decoded = decode_json($json);
my @pools = @{ $decoded->{'pools'} };

foreach my $f ( @pools ) {
  my %hash;
  $hash{'{#PLNAME}'} = $f->{'name'};
  push( @{$output {'data'}}, \%hash);
}

print encode_json \%output;

