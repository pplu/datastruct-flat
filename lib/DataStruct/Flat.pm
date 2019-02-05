package DataStruct::Flat;
  use Moo;

  #has HashDelimiter => (is => 'ro', default => sub { '.' });
  #has ArrayDelimiter => (is => 'ro', default => sub { '.' });

  sub flatten {
    my ($self, $struct) = @_;

    my $result = {};
    _flatten($struct, undef, $result);
    return $result;
  }

  sub _flatten {
    my ($struct, $prefix, $result) = @_;

    if (ref($struct) eq 'HASH') {
      foreach my $key (keys %$struct) {
        my $local_prefix = (defined $prefix) ? "$prefix." : "";
        my $key_in_result = $key;
        $key_in_result =~ s/\./\\./g;
        _flatten($struct->{ $key }, "$local_prefix$key_in_result", $result);
      }
    } elsif (ref($struct) eq 'ARRAY') {
      my $i = 0;
      foreach my $element (@$struct) {
        my $local_prefix = (defined $prefix) ? "$prefix." : ""; 
        _flatten($element, "$local_prefix$i", $result);
        $i++;
      }
    } else {
      my $local_prefix = (defined $prefix) ? $prefix : '';
      $result->{ $prefix } = $struct;
    }
  }
1;
