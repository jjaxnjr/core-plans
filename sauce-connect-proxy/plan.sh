pkg_name=sauce-connect-proxy
pkg_origin=core
pkg_version=4.5.4
pkg_license=('MIT')
pkg_upstream_url=https://wiki.saucelabs.com/display/DOCS/Sauce+Connect+Proxy
pkg_description="Sauce Connect™ is a proxy server that opens a secure connection between a Sauce Labs virtual machine running your browser tests, and an application or website you want to test that's on your local machine or behind a corporate firewall."
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://saucelabs.com/downloads/sc-${pkg_version}-linux.tar.gz"
pkg_shasum=6eb18a5a3f77b190fa0bb48bcda4694d26731703ac3ee56499f72f820fe10ef1
pkg_filename="sc-${pkg_version}-linux.tar.gz"
pkg_deps=(
  core/curl
  core/gcc-libs
  core/glibc
  core/icu52
  core/krb5
  core/libunwind
  core/lttng-ust
  core/openssl
  core/util-linux
  core/zlib
)
pkg_build_deps=(
  core/patchelf
)
pkg_bin_dirs=(bin)

do_unpack() {
  # Extract into $pkg_dirname instead of straight into $HAB_CACHE_SRC_PATH.
  cd "${HAB_CACHE_SRC_PATH}" || exit
  tar --extract --file="${HAB_CACHE_SRC_PATH}/${pkg_filename}" bin/sc -C "${HAB_CACHE_SRC_PATH}/${pkg_dirname}"
  # mkdir -p "${HAB_CACHE_SRC_PATH}/${pkg_dirname}"
  # tar xf "${HAB_CACHE_SRC_PATH}/${pkg_filename}" \
  #   -C "${HAB_CACHE_SRC_PATH}/${pkg_dirname}" \
  #   --no-same-owner
}

do_build() {
  return 0
}

do_install() {
  cp -a . "${pkg_prefix}/bin"
  chmod o+r -R "${pkg_prefix}/bin"
}

do_strip() {
  return 0
}
