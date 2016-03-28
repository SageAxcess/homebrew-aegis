require 'formula'

class AegisPlugins < Formula
  version "1.0.5"
  url 'http://build.sageaxcess.com/brew/aegis-plugins_1.0.5_x86_64.tar.gz'
  homepage 'http://www.sageaxcess.com'
  sha256 "00224e3708316ced60986dd9f320d2a53f352e8a1f9cd4641f71cc923dd1cce7"

  depends_on "aegis"

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
