require 'formula'

class AegisBroPlugins < Formula
  version "1.0.5"
  url 'http://itserviceplus.net/aegis-bro-plugins.tar.gz'
  homepage 'http://www.sageaxcess.com'
  sha256 'bcf9c9c5d11c761f5696e752c85231f420a214b6352616a836781fad8fb35bc7'

  def install
    system "echo", "Installing bro plugins at #{Formula["bro"].lib}/bro/plugins"
    system "echo", "WARNING: Your bro installation will be modified"
    system "echo", "         if you remove this package, you should reinstall bro."
    system "cp -R -f 1.0.5/* #{prefix}"
    system "mkdir -p #{Formula["bro"].lib}/bro/plugins"
    system "ln -s #{prefix}/plugins/SageAxcess_ZMQ #{Formula["bro"].lib}/bro/plugins/SageAxcess_ZMQ"
    system "ln -s #{prefix}/plugins/SageAxcess_SMB1 #{Formula["bro"].lib}/bro/plugins/SageAxcess_SMB1"
    system "ln -s #{prefix}/plugins/SageAxcess_TDS #{Formula["bro"].lib}/bro/plugins/SageAxcess_TDS"
    system "ln -s #{prefix}/plugins/SageAxcess_LDAP #{Formula["bro"].lib}/bro/plugins/SageAxcess_LDAP"
    system "cp -R -f #{prefix}/scripts/* #{Formula["bro"].share}/bro"
  end
end