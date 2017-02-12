package Bot::IRC::X::Message;
# ABSTRACT: Bot::IRC plugin for leaving messages for nicks

use 5.012;
use strict;
use warnings;

use DateTime;
use DateTime::Format::Human::Duration;

# VERSION

sub init {
    my ($bot) = @_;
    $bot->load('Store');

    $bot->hook(
        {
            to_me => 1,
            text  => qr/^message\s+(?<nick>\S+)\s+(?<msg>.+)\s*/,
        },
        sub {
            my ( $bot, $in, $m ) = @_;

            my $nick = lc( $m->{nick} );
            my @msgs = @{ $bot->store->get($nick) || [] };

            push( @msgs, {
                in   => $in,
                time => time,
                msg  => $m->{msg},
            } );
            $bot->store->set( $nick => \@msgs );

            $bot->reply_to('OK.');
        },
    );

    my $duration = DateTime::Format::Human::Duration->new;
    $bot->hook(
        {
            command => 'JOIN',
        },
        sub {
            my ( $bot, $in ) = @_;

            my $nick = lc( $in->{nick} );
            my @msgs = @{ $bot->store->get($nick) || [] };

            $bot->store->set( $nick => [] );

            for ( my $i = 0; $i < @msgs; $i++ ) {
                $bot->reply_to(
                    "$msgs[$i]->{in}{nick} left a message for you " .
                    $duration->format_duration_between(
                        map { DateTime->from_epoch( epoch => $_ ) } $msgs[$i]->{time}, time
                    ) .
                    " ago. \"$msgs[$i]->{msg}\""
                );
                sleep 1 if ( $i + 1 < @msgs );
            }

            return;
        },
    );

    $bot->helps( message => 'Leave a message for a nick. Usage: <bot nick> message <target nick> <message>');
}

1;
__END__
=pod

=begin :badges

=for markdown
[![Build Status](https://travis-ci.org/gryphonshafer/Bot-IRC-X-Message.svg)](https://travis-ci.org/gryphonshafer/Bot-IRC-X-Message)
[![Coverage Status](https://coveralls.io/repos/gryphonshafer/Bot-IRC-X-Message/badge.png)](https://coveralls.io/r/gryphonshafer/Bot-IRC-X-Message)

=end :badges

=head1 SYNOPSIS

    use Bot::IRC;

    Bot::IRC->new(
        connect => { server => 'irc.perl.org' },
        plugins => ['Message'],
    )->run;

=head1 DESCRIPTION

This L<Bot::IRC> plugin provides the means for the bot to keep messages for
nicks.

    <user1> bot message user2 This is a message for you.
    <bot> user1: OK.
    *** user2 has joined #this_channel
    <bot> user2: user1 left a message for you. "This is a message for you."

=head1 SEE ALSO

You can look for additional information at:

=for :list
* L<Bot::IRC>
* L<GitHub|https://github.com/gryphonshafer/Bot-IRC-X-Message>
* L<CPAN|http://search.cpan.org/dist/Bot-IRC-X-Message>
* L<MetaCPAN|https://metacpan.org/pod/Bot::IRC::X::Message>
* L<AnnoCPAN|http://annocpan.org/dist/Bot-IRC-X-Message>
* L<Travis CI|https://travis-ci.org/gryphonshafer/Bot-IRC-X-Message>
* L<Coveralls|https://coveralls.io/r/gryphonshafer/Bot-IRC-X-Message>
* L<CPANTS|http://cpants.cpanauthors.org/dist/Bot-IRC-X-Message>
* L<CPAN Testers|http://www.cpantesters.org/distro/T/Bot-IRC-X-Message.html>

=for Pod::Coverage init

=cut
