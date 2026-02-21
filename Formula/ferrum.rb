class Ferrum < Formula
  desc "A GPU-accelerated terminal emulator"
  homepage "https://github.com/itsserbin/ferrum"
  version "0.3.0"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/itsserbin/ferrum/releases/download/v0.3.0/ferrum-aarch64-apple-darwin.zip"
      sha256 "c557d055a8b5bd46b30dbe716b3690093186c68722612a9ca99ca08176adc431"
    end
    on_intel do
      url "https://github.com/itsserbin/ferrum/releases/download/v0.3.0/ferrum-x86_64-apple-darwin.zip"
      sha256 "aefe08472dcccdb0152a9f83f10a469bdf3dddd3e5b227452fa7d778d45465cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/itsserbin/ferrum/releases/download/v0.3.0/ferrum-x86_64-unknown-linux-gnu.zip"
      sha256 "3419014a9a85c3bb1e2267953610d252ffc3367b0a0a90f0c9ac0af7a80c5fa3"
    end
  end

  def install
    bin.install "ferrum"
  end
end
