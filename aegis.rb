require 'formula'

class Aegis < Formula
  desc "AEGIS Network Monitor"
  homepage "https://changedynamix.io"
  url "https://aegis-osx.s3.amazonaws.com/aegis_2.4.4_x86_64.tar.gz"
  sha256 "3edd50b8842fa55567982339791e49edb4b6e160fcd5d42fec3de8090370e862"
  version "2.4.4"

  depends_on "openssl"
  depends_on "gnutls"
  depends_on "msgpack"
  depends_on "zeromq"
  depends_on "geoip" => :recommended

  conflicts_with "bro", :because => "This is a different bro version"

  def install
     system "echo", "WARNING: If you want to use aegis without sudo, run"
     system "echo", "sudo chmod +r /dev/bpf*"

     bin.install Dir["2.4.4/bin/*"]
     include.install Dir["2.4.4/include/*"]
     lib.install Dir["2.4.4/lib/*"]
     share.install Dir["2.4.4/share/*"]
     etc.install Dir["2.4.4/etc/*"]
     (prefix/"conf").install Dir["2.4.4/conf/*"]
  end

  plist_options :startup => true
  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ProgramArguments</key>
        <array>
            <string>#{opt_bin}/aegis</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{opt_prefix}</string>
        <key>StandardErrorPath</key>
        <string>/dev/null</string>
        <key>StandardOutPath</key>
        <string>/dev/null</string>
      </dict>
    </plist>
    EOS
  end

  test do
    system "#{bin}/aegis", "--version"
  end
end
