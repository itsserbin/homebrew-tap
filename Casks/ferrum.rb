cask "ferrum" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0"

  url "https://github.com/itsserbin/ferrum/releases/download/v#{version}/ferrum-#{arch}-apple-darwin.dmg"

  sha256 arm:   "480e7762cde175f1eed974fb391165618bc31e04bc9a5241ffa8cb31d6c43c5c",
         intel: "04c2fc7836d56e0eb83e7f2b63f22326daf82b6c0d1e389f1db12f6c380d675f"

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
