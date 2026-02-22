cask "ferrum" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.4.0"

  url "https://github.com/itsserbin/ferrum/releases/download/v#{version}/ferrum-#{arch}-apple-darwin.dmg"

  sha256 arm:   "28e944e13f05835610a68c337d8f4791cbd2dc558a3e557d8d3847ff8f5e0e8d",
         intel: "c8347dca7a9a75c3296d8afb22615ddda87e3e14e76a7d4bcb21b7edbbff53fe"

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
