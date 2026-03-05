cask "ferrum" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0"

  url "https://github.com/itsserbin/ferrum/releases/download/v#{version}/ferrum-#{arch}-apple-darwin.dmg"

  sha256 arm:   "c631c6d74d9686d6375cda9619d49637ce9ff8393c107895887025712968287e",
         intel: "b18035c448c5e4db0c6fe4a084bca697379e61b5e9e670c02dabba596067fef9"

  name "Ferrum"
  desc "GPU-accelerated terminal emulator"
  homepage "https://github.com/itsserbin/ferrum"

  app "Ferrum.app"
  binary "#{appdir}/Ferrum.app/Contents/MacOS/Ferrum", target: "ferrum"

  zap trash: [
    "~/Library/Application Support/ferrum",
    "~/Library/Preferences/com.ferrum.terminal.plist",
  ]
end
