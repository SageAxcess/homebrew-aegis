require 'formula'

class AegisPlugins < Formula
  version "1.0.5"
  url 'http://build.sageaxcess.com/brew/aegis-plugins_1.0.5_x86_64.tar.gz'
  homepage 'http://www.sageaxcess.com'
  sha256 "6bf1e84fed5ef008d3c65fe0e23a6f6ff456ebb3af37fd1317931dd9f32be325"

  depends_on "aegis"
  depends_on "gnutls"

  def install
    system "echo", "Installing aegis plugins at #{Formula["aegis"].lib}/bro/plugins"
    system "echo", "WARNING: Your bro installation will be modified"
    system "echo", "         if you remove this package, you should reinstall bro."
    system "cp -Rf 1.0.5/* #{prefix}"
    system "mkdir -p #{Formula["aegis"].lib}/bro/plugins"
    system "ln -s #{prefix}/plugins/SageAxcess_ZMQ #{Formula["aegis"].lib}/bro/plugins/SageAxcess_ZMQ"
    system "ln -s #{prefix}/plugins/SageAxcess_SMB1 #{Formula["aegis"].lib}/bro/plugins/SageAxcess_SMB1"
    system "ln -s #{prefix}/plugins/SageAxcess_TDS #{Formula["aegis"].lib}/bro/plugins/SageAxcess_TDS"
    system "ln -s #{prefix}/plugins/SageAxcess_LDAP #{Formula["aegis"].lib}/bro/plugins/SageAxcess_LDAP"
    system "ln -s #{prefix}/plugins/SageAxcess_HTTPReader #{Formula["aegis"].lib}/bro/plugins/SageAxcess_HTTPReader"
    system "ln -s #{prefix}/plugins/SageAxcess_Updater #{Formula["aegis"].lib}/bro/plugins/SageAxcess_Updater"
    system "cp -Rf #{prefix}/scripts/* #{Formula["aegis"].share}/bro"
  end
end
