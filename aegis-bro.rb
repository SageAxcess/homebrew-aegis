require 'formula'

class AegisBro < Formula
  desc "Network security monitor"
  homepage "https://www.bro.org"
  url "http://build.sageaxcess.com/brew/aegis-bro_2.4.1_x86_64.tar.gz"
  sha256 "d47bdf8b803a6a67ef36a2a736c844fc659ebc2325595b876b86023086391e29"
  version "2.4.1"

  depends_on "openssl"
  depends_on "geoip" => :recommended

  conflicts_with "brotli", :because => "Both install a `bro` binary"
  conflicts_with "bro", :because => "This is a different bro version"

  def install
     system "echo", "WARNING: If you want to use bro without sudo, run"
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
            <string>#{opt_bin}/bro</string>
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
    system "#{bin}/bro", "--version"
  end
end
