require 'formula'

class AegisAggregator < Formula
  desc "Aegis Aggregator service"
  homepage "https://sageaxcess.com"
  url "http://build.sageaxcess.com/brew/aegis-aggregator_1.0.2_x86_64.tar.gz"
  sha256 "b827fe711fa62e6a0a450c698d5a3a6e13d945ce94e4b62d3b987f47c13d77c4"
  version "1.0.2"

  depends_on "msgpack"
  depends_on "zeromq"

  def install
     conf = prefix/"conf"
     bin.install Dir["1.0.2/bin/*"]
     conf.install Dir["1.0.2/conf/*"]
  end

  def post_install
     queue = prefix/"queue"
     logs = prefix/"logs"

     queue.mkpath
     logs.mkpath
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
            <string>#{opt_bin}/AegisAggregator</string>
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
