summary "Audio codec designed for speech"
webpage "https://speex.org"
src_url "https://downloads.xiph.org/releases/speex/speex-1.2.0.tar.gz"
src_sum "eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094"
depends "libogg speexdsp"

build() {
    configure \
        OGG_CFLAGS="-logg" \
        OGG_LIBS="-logg" \
        SPEEXDSP_CFLAGS="-lspeexdsp" \
        SPEEXDSP_LIBS="-lspeexdsp"
}
