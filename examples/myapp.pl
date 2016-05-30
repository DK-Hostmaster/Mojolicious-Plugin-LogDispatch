#!/usr/bin/env perl
use Mojolicious::Lite;

use FindBin;
use lib "$FindBin::Bin/../lib";

# Documentation browser under "/perldoc"
#plugin 'LogDispatch';

get '/' => sub {
  my $self = shift;

  use Data::Dumper;
  print STDERR Dumper $self->app->log;

  $self->app->log->debug('THIS IS A TEST');
  $self->render('index');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
Welcome to the Mojolicious real-time web framework!

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
