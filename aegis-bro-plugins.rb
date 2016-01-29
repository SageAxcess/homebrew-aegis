require 'formula'

class AegisBroPlugins < Formula
  version "1.0.5"
  url 'http://build.sage.axcess.com/brew/aegis-bro-plugins_1.0.5_x86_64.tar.gz'
  homepage 'http://www.sageaxcess.com'
  sha256 "955cbe12be8b86844394fed56e211baf711ab4af3608009a0a02eff72cc7f4b8"

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
    system "ln -s #{prefix}/plugins/SageAxcess_HTTPReader #{Formula["aegis-bro"].lib}/bro/plugins/SageAxcess_HTTPReader"
    system "ln -s #{prefix}/plugins/SageAxcess_Updater #{Formula["aegis-bro"].lib}/bro/plugins/SageAxcess_Updater"
    system "cp -Rf #{prefix}/scripts/* #{Formula["aegis-bro"].share}/bro"
  end
end
