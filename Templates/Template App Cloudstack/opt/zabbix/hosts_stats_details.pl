#!/usr/bin/perl
use strict;
use warnings;
use JSON qw( decode_json encode_json );
use Data::Dumper;

my %output;
my $uuid = $ARGV[0];
my $part = $ARGV[1];

$output{'data'} = [];

my $json = `curl -s -k "https://localhost/client/api?apikey=##API-KEY##&command=listHosts&response=json&signature=##SIGNATUR##" | jq '.listhostsresponse'`;
my $decoded = decode_json($json);
my @host = @{ $decoded->{'host'} };

foreach my $f ( @host ) {
  if ( $f->{'name'} eq $uuid ) {
#    print Dumper(\$f);
    print $f->{'details'}{$part};
  }
}

