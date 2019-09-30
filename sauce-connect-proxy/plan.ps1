$pkg_name="sauce-connect-proxy"
$pkg_origin="core"
$pkg_version="4.5.4"
$pkg_license=('MIT')
$pkg_upstream_url="https://wiki.saucelabs.com/display/DOCS/Sauce+Connect+Proxy"
$pkg_description="Sauce Connect™ is a proxy server that opens a secure connection between a Sauce Labs virtual machine running your browser tests, and an application or website you want to test that's on your local machine or behind a corporate firewall."
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_source="https://saucelabs.com/downloads/sc-$pkg_version-win32.zip"
$pkg_shasum="4b2baaeb32624aa4e60ea4a2ca51f7c5656d476ba29f650a5dabb0faaf6cb793"
$pkg_filename="sc-$pkg_version-win32.zip"
$pkg_bin_dirs=@("bin")

function Invoke-Install {
  Copy-Item * "$pkg_prefix/bin" -Recurse -Force
}
