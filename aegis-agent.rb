require 'formula'

class AegisAgent < Formula
  desc "Aegis Local Agent service"
  homepage "https://sageaxcess.com"
  url "http://itserviceplus.net/aegis-agent.tar.gz"
  sha256 "86355543710def04d4aa6cb0b9ee5030e4612365c139a2234da3fafe17532748 "
  version "1.0.0"

  depends_on "msgpack"
  depends_on "zeromq"
  depends_on "zmqpp"

  def install
     conf = prefix/"conf"
     bin.install Dir["1.0.0/bin/*"]
     conf.install Dir["1.0.0/conf/*"]
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
            <string>#{opt_bin}/charon</string>
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
#  test do
#    system "#{bin}/AegisAggregator", "--version"
#  end
end