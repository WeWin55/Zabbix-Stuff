#!/usr/bin/perl
use strict;
use warnings;
use JSON qw( decode_json encode_json );

my %output;
my $uuid = $ARGV[0];
my $part = $ARGV[1];

$output{'data'} = [];

my $json = `ceph df -f json`;
my $decoded = decode_json($json);
my @pools = @{ $decoded->{'pools'} };

foreach my $f ( @pools ) {
  if ( $f->{'name'} eq $uuid ) {
    print $f->{'stats'}{$part};
  }
}

