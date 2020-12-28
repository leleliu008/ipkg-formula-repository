summary "Pager program similar to more"
webpage "http://www.greenwoodsoftware.com/less/index.html"
src_url "http://www.greenwoodsoftware.com/less/less-551.tar.gz"
src_sum "ff165275859381a63f19135a8f1f6c5a194d53ec3187f94121ecd8ef0795fe3d"
license "GPL-3.0-or-later"
depends "ncurses pcre2"

prepare() {
    inject_stub_system lsystem.c &&
    sed_in_place 's/TERMLIBS=/TERMLIBS="-lncurses"/' configure
}

build() {
    configure \
        --with-regex='pcre2' \
        --with-secure \
        ac_cv_lib_tinfo_tgoto=no \
        ac_cv_lib_xcurses_initscr=no \
        ac_cv_lib_ncursesw_initscr=no \
        ac_cv_lib_ncurses_initscr=yes \
        ac_cv_lib_curses_initscr=no \
        ac_cv_lib_termcap_tgetent=no \
        ac_cv_lib_termlib_tgetent=no
}
