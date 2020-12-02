summary  "Frontend for libraries libburn and libisofs"
homepage "https://www.libburnia-project.org"
url      "http://files.libburnia-project.org/releases/libisoburn-1.5.2.tar.gz"
sha256   "cc720bc9511d8e0b09365e2c8b0e40817986be308cd96ca2705c807c955590ec"
dependencies "libisofs libburn"

build() {
    configure \
        --enable-xattr \
        --enable-zlib \
        --disable-libcdio \
        --disable-libjte \
        --disable-libacl \
        --disable-libedit \
        --disable-libreadline
}
