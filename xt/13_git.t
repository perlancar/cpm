use strict;
use warnings;
use Test::More;
use xt::CLI;

subtest git1 => sub {
    my $r = cpm_install "-v", "https://github.com/skaji/change-shebang.git";
    is $r->exit, 0;
    note $r->err;
};

subtest git2 => sub {
    my $r = cpm_install "-v", 'https://github.com/skaji/change-shebang.git@0.05', "App::FatPacker";
    is $r->exit, 0;
    note $r->err;
};

subtest fail => sub {
    my $r = cpm_install "-v", "git://github.com/skaji/xxxxx.git";
    isnt $r->exit, 0;
    note $r->err;
    $r = cpm_install "-v", 'git://github.com/skaji/change-shebang.git@xxxxxx';
    isnt $r->exit, 0;
    note $r->err;
};

done_testing;
