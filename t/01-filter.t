use strict;
use warnings;
use Template;
use Text::Trac;
use Test::More tests=> 3;

###############################################################################
# Trac WikiFormatting that we're using to test with.
my $text = qq{
= Heading One =
== Heading Two ==
 * list one
 * list two
   * sub list one
   * sub list two
};

###############################################################################
# Make sure that TT works
check_tt: {
    my $tt = Template->new();
    my $template = qq{hello world!};
    my $output;
    $tt->process( \$template, undef, \$output );
    is( $output, $template, 'TT works' );
}

###############################################################################
# Use Trac as a FILTER
filter: {
    my $tt = Template->new();
    my $template = qq{
[%- USE Trac -%]
[%- FILTER trac -%]$text\[%- END -%]
};
    my $expected = Text::Trac->new()->parse( $text );
    my $output;
    $tt->process( \$template, undef, \$output );
    is( $output, $expected, 'Works in [% FILTER ... %] block' );
}

###############################################################################
# Use Trac filter inline
filter_inline: {
    my $tt = Template->new();
    my $template = qq{
[%- USE Trac -%]
[%- text | trac -%]
};
    my $expected = Text::Trac->new()->parse( $text );
    my $output;
    $tt->process( \$template, { 'text' => $text }, \$output );
    is( $output, $expected, 'Works as inline filter' );
}
