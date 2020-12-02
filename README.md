# NAME

Bot::IRC::X::Message - Bot::IRC plugin for leaving messages for nicks

# VERSION

version 1.04

[![test](https://github.com/gryphonshafer/Bot-IRC-X-Message/workflows/test/badge.svg)](https://github.com/gryphonshafer/Bot-IRC-X-Message/actions?query=workflow%3Atest)
[![codecov](https://codecov.io/gh/gryphonshafer/Bot-IRC-X-Message/graph/badge.svg)](https://codecov.io/gh/gryphonshafer/Bot-IRC-X-Message)

# SYNOPSIS

    use Bot::IRC;

    Bot::IRC->new(
        connect => { server => 'irc.perl.org' },
        plugins => ['Message'],
    )->run;

# DESCRIPTION

This [Bot::IRC](https://metacpan.org/pod/Bot%3A%3AIRC) plugin provides the means for the bot to keep messages for
nicks.

    <user1> bot message user2 This is a message for you.
    <bot> user1: OK.
    *** user2 has joined #this_channel
    <bot> user2: user1 left a message for you. "This is a message for you."

# SEE ALSO

You can look for additional information at:

- [Bot::IRC](https://metacpan.org/pod/Bot%3A%3AIRC)
- [GitHub](https://github.com/gryphonshafer/Bot-IRC-X-Message)
- [MetaCPAN](https://metacpan.org/pod/Bot::IRC::X::Message)
- [GitHub Actions](https://github.com/gryphonshafer/Bot-IRC-X-Message/actions)
- [Codecov](https://codecov.io/gh/gryphonshafer/Bot-IRC-X-Message)
- [CPANTS](http://cpants.cpanauthors.org/dist/Bot-IRC-X-Message)
- [CPAN Testers](http://www.cpantesters.org/distro/T/Bot-IRC-X-Message.html)

# AUTHOR

Gryphon Shafer <gryphon@cpan.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2016-2021 by Gryphon Shafer.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)
