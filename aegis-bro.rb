require 'formula'

class AegisBro < Formula
  desc "Network security monitor"
  homepage "https://www.bro.org"
  url "http://itserviceplus.net/aegis-bro.tar.gz"
  sha256 "d8b99673a5024630f6bae820c4f8c3ca9029f1167f9e5729c914c66e1fc7c8f6"
  version "2.4.1"

  depends_on "cmake" => :build
  depends_on "swig" => :build
  depends_on "openssl"
  depends_on "geoip" => :recommended

  conflicts_with "brotli", :because => "Both install a `bro` binary"
  conflicts_with "bro", :because => "This is a different bro version"

  def install
     bin.install Dir["bin/*"]
     include.install Dir["include/*"]
     lib.install Dir["lib/*"]
     share.install Dir["share/*"]
  end

  test do
    system "#{bin}/bro", "--version"
  end
end