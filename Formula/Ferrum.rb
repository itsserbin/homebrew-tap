class Ferrum < Formula
  desc "A GPU-accelerated terminal emulator"
  homepage "https://github.com/itsserbin/ferrum"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/itsserbin/ferrum/releases/download/v0.1.3/Ferrum-aarch64-apple-darwin.zip"
      sha256 "b2b607022e095c11ada5b19a2740360995ece5788bcb908450786c44432f3819"
    end
    if Hardware::CPU.intel?
      url "https://github.com/itsserbin/ferrum/releases/download/v0.1.3/Ferrum-x86_64-apple-darwin.zip"
      sha256 "84eb1c7371b43b45ab929a2e1c704c99278986a0605efafb627caee849d606ed"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/itsserbin/ferrum/releases/download/v0.1.3/Ferrum-x86_64-unknown-linux-gnu.zip"
      sha256 "6051cbfa258176f6adc91cb53211180dbb100e8fe6d6ce8a478a2fe85cff0e5d"
  end
  license "GPL-3.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "ferrum" if OS.mac? && Hardware::CPU.arm?
    bin.install "ferrum" if OS.mac? && Hardware::CPU.intel?
    bin.install "ferrum" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
