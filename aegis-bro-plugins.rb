require 'formula'

class AegisBroPlugins < Formula
  version "1.0.5"
  url 'http://build.sage.axcess.com/brew/aegis-bro-plugins_1.0.5_x86_64.tar.gz'
  homepage 'http://www.sageaxcess.com'
  sha256 "2bcae31a318791fc9cc9fa968e7b5b50c7d41b707e89f00f5f49a528fa01ed86"

  depends_on "aegis-bro"

  def install
    system "echo", "Installing bro plugins at #{Formula["aegis-bro"].lib}/bro/plugins"
    system "echo", "WARNING: Your bro installation will be modified"
    system "echo", "         if you remove this package, you should reinstall bro."
    system "cp -Rf 1.0.5/* #{prefix}"
    system "mkdir -p #{Formula["aegis-bro"].lib}/bro/plugins"
    system "ln -s #{prefix}/plugins/SageAxcess_ZMQ #{Formula["aegis-bro"].lib}/bro/plugins/SageAxcess_ZMQ"
    system "ln -s #{prefix}/plugins/SageAxcess_SMB1 #{Formula["aegis-bro"].lib}/bro/plugins/SageAxcess_SMB1"
    system "ln -s #{prefix}/plugins/SageAxcess_TDS #{Formula["aegis-bro"].lib}/bro/plugins/SageAxcess_TDS"
    system "ln -s #{prefix}/plugins/SageAxcess_LDAP #{Formula["aegis-bro"].lib}/bro/plugins/SageAxcess_LDAP"
    system "cp -Rf #{prefix}/scripts/* #{Formula["aegis-bro"].share}/bro"
  end
end
