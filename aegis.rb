require 'formula'

class Aegis < Formula
  desc "Network security monitor"
  homepage "https://www.bro.org"
  url "http://build.sageaxcess.com/brew/aegis_2.4.1_x86_64.tar.gz"
  sha256 "6a67308e3fc4619cf28a8e305287ca81cbf711666781ef234f7853290b378f52"
  version "2.4.1"

  depends_on "openssl"
  depends_on "geoip" => :recommended

  conflicts_with "bro", :because => "This is a different bro version"

  def install
     system "echo", "WARNING: If you want to use aegis without sudo, run"
     system "echo", "sudo chmod +r /dev/bpf*"

     bin.install Dir["2.4.1/bin/*"]
     include.install Dir["2.4.1/include/*"]
     lib.install Dir["2.4.1/lib/*"]
     share.install Dir["2.4.1/share/*"]
     etc.install Dir["2.4.1/etc/*"]
     (prefix/"conf").install Dir["2.4.1/conf/*"]
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
