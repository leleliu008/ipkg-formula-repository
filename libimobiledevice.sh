summary  "Library to communicate with iOS devices natively"
homepage "https://www.libimobiledevice.org"
url      "https://github.com/libimobiledevice/libimobiledevice/releases/download/1.3.0/libimobiledevice-1.3.0.tar.bz2"
sha256   "53f2640c6365cd9f302a6248f531822dc94a6cced3f17128d4479a77bd75b0f6"
license  "LGPL-2.1"
dependencies "openssl libusbmuxd"

build() {
    configure --without-cython
}
