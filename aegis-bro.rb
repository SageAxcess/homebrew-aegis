require 'formula'

class AegisBro < Formula
  desc "Network security monitor"
  homepage "https://www.bro.org"
  url "http://itserviceplus.net/aegis-bro.tar.gz"
  sha256 "0f38ca077dcdf51dc50fc356cfa9d0c0017f699801612543d0c4402525827ca1"
  version "2.4.1"

  depends_on "openssl"
  depends_on "geoip" => :recommended

  conflicts_with "brotli", :because => "Both install a `bro` binary"
  conflicts_with "bro", :because => "This is a different bro version"

  def install
     bin.install Dir["bin/*"]
     include.install Dir["include/*"]
     lib.install Dir["lib/*"]
     share.install Dir["share/*"]
     etc.install Dir["etc/*"]
  end

  test do
    system "#{bin}/bro", "--version"
  end
end