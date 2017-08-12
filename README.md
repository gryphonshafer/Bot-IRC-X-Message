# NAME

Bot::IRC::X::Message - Bot::IRC plugin for leaving messages for nicks

# VERSION

version 1.03

[![Build Status](https://travis-ci.org/gryphonshafer/Bot-IRC-X-Message.svg)](https://travis-ci.org/gryphonshafer/Bot-IRC-X-Message)
[![Coverage Status](https://coveralls.io/repos/gryphonshafer/Bot-IRC-X-Message/badge.png)](https://coveralls.io/r/gryphonshafer/Bot-IRC-X-Message)

# SYNOPSIS

    use Bot::IRC;

    Bot::IRC->new(
        connect => { server => 'irc.perl.org' },
        plugins => ['Message'],
    )->run;

# DESCRIPTION

This [Bot::IRC](https://metacpan.org/pod/Bot::IRC) plugin provides the means for the bot to keep messages for
nicks.

    <user1> bot message user2 This is a message for you.
    <bot> user1: OK.
    *** user2 has joined #this_channel
    <bot> user2: user1 left a message for you. "This is a message for you."

# SEE ALSO

You can look for additional information at:

- [Bot::IRC](https://metacpan.org/pod/Bot::IRC)
- [GitHub](https://github.com/gryphonshafer/Bot-IRC-X-Message)
- [CPAN](http://search.cpan.org/dist/Bot-IRC-X-Message)
- [MetaCPAN](https://metacpan.org/pod/Bot::IRC::X::Message)
- [AnnoCPAN](http://annocpan.org/dist/Bot-IRC-X-Message)
- [Travis CI](https://travis-ci.org/gryphonshafer/Bot-IRC-X-Message)
- [Coveralls](https://coveralls.io/r/gryphonshafer/Bot-IRC-X-Message)
- [CPANTS](http://cpants.cpanauthors.org/dist/Bot-IRC-X-Message)
- [CPAN Testers](http://www.cpantesters.org/distro/T/Bot-IRC-X-Message.html)

# AUTHOR

Gryphon Shafer <gryphon@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Gryphon Shafer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
