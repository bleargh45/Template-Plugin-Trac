# NAME

Template::Plugin::Trac - TT filter for Text::Trac

# SYNOPSIS

```
[% USE Trac %]
...
[% FILTER trac %]
  = Heading One =
  == Heading Two ==
[% END %]
...
[% text | trac %]
```

# DESCRIPTION

`Template::Plugin::Trac` is a plugin for TT, which formats your text using
Trac's WikiFormatting style.

# METHODS

- init()

    Initializes the template plugin.

- filter($txt, $args, $config)

    Filters the given text, by running it through `Text::Trac`.

# AUTHOR

Graham TerMarsch <cpan@howlingfrog.com>

# COPYRIGHT

Copyright (C) 2006-2007, Graham TerMarsch.  All rights Reserved.

This is free software; you can redistribute it and/or modify it under the same
terms as Perl itself.

# SEE ALSO

[Text::Trac](https://metacpan.org/pod/Text%3A%3ATrac),
[Template::Plugin::Filter](https://metacpan.org/pod/Template%3A%3APlugin%3A%3AFilter).
