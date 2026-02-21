class Ferrum < Formula
  desc "A GPU-accelerated terminal emulator"
  homepage "https://github.com/itsserbin/ferrum"
  version "0.3.1"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/itsserbin/ferrum/releases/download/v0.3.1/ferrum-aarch64-apple-darwin.zip"
      sha256 "3cecab88032dd24ec59b74aef4552e9e748b50d9f69d4b9e8f59f9058d2e2d9a"
    end
    on_intel do
      url "https://github.com/itsserbin/ferrum/releases/download/v0.3.1/ferrum-x86_64-apple-darwin.zip"
      sha256 "6d478e03893ac39eda4d1d2a6dbc6b7791f8b0e551205b098895594acd9b5728"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/itsserbin/ferrum/releases/download/v0.3.1/ferrum-x86_64-unknown-linux-gnu.zip"
      sha256 "09ac3e2f47e922b00c95cf283e4a96ee1306042c0948c0545e2c07c1476985e4"
    end
  end

  def install
    bin.install "ferrum"
  end
end
