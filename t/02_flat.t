#!/usr/bin/env perl

use strict;
use warnings;
use DataStruct::Flat;

use Test::More;

{
  my $flattener = DataStruct::Flat->new;
  is_deeply({
    'x' => 1,
    'y.0' => 42,
    'y.1' => 43,
    'y.2' => 44,
    'z.0.x' => 88,
    'z.0.y' => 89,
  }, $flattener->flatten({
    x => 1,
    y => [ 42, 43, 44 ],
    z => [ { x => 88, y => 89 } ],
  }), 'Got correct flattened datastructure');
}

done_testing;
