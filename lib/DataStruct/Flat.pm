package DataStruct::Flat;
  use Moo;

  has HashDelimiter => (is => 'ro', default => sub { '.' });
  has ArrayDelimiter => (is => 'ro', default => sub { '.' });

  sub flatten {
    my ($self, $struct) = @_;

    if (ref($struct) eq 'HASH') {
      
    } elsif (ref($struct eq 'ARRAY')) {

    } else {
      die "Don't know how to flatten non-hashref or non-arrayref things, but found a " . ref($struct);
    }
  }

  sub _flatten {
    my ($self, $struct)

  }
1;
