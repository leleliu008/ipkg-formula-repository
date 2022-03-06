package set summary "User-friendly command-line shell for UNIX-like operating systems"
package set webpage "https://fishshell.com"
package set git.url "https://github.com/fish-shell/fish-shell.git"
package set src.url "https://github.com/fish-shell/fish-shell/releases/download/3.3.1/fish-3.3.1.tar.xz"
package set src.sum "b5b4ee1a5269762cbbe993a4bd6507e675e4100ce9bbe84214a5eeb2b19fae89"
package set license "GPL-2.0"
package set bsystem "cmake"
package set dep.pkg "pcre2 bzip2 ncurses readline"

# ld: targeted OS version does not support use of thread local variables in __ZZ9thread_idvE6tl_tid for architecture armv7

prepare() {
    inject_stub_system src/print_help.cpp
}

build() {
    cmakew \
        -DWITH_GETTEXT=OFF \
        -DPCRE2_INCLUDE_DIR="$pcre2_INCLUDE_DIR" \
        -DPCRE2_LIB="$pcre2_LIBRARY_DIR/libpcre2-32.a" \
        -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
        -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a" \
        -DBZIP2_INCLUDE_DIR="$bzip2_INCLUDE_DIR" \
        -DBZIP2_LIBRARY_RELEASE="$bzip2_LIBRARY_DIR/libbz2.a" \
        -DREADLINE_INCLUDE_DIR="$readline_INCLUDE_DIR" \
        -DREADLINE_LIBRARY="$readline_LIBRARY_DIR/libreadline.a" \
        -DCURSES_INCLUDE_PATH="$ncurses_INCLUDE_DIR" \
        -DCURSES_CURSES_LIBRARY="$ncurses_LIBRARY_DIR/libncurses.a" \
        -DCURSES_NCURSES_LIBRARY="$ncurses_LIBRARY_DIR/libncurses.a" \
        -DCURSES_FORM_LIBRARY="$ncurses_LIBRARY_DIR/libform.a"
}
