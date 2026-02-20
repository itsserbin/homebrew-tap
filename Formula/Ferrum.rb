class Ferrum < Formula
  desc "A GPU-accelerated terminal emulator"
  homepage "https://github.com/itsserbin/ferrum"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/itsserbin/ferrum/releases/download/v0.2.1/Ferrum-aarch64-apple-darwin.zip"
      sha256 "a0f69dbbec19b5b68f66807f43eadb77c4d9667a3ce0687657114c4947d558b2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/itsserbin/ferrum/releases/download/v0.2.1/Ferrum-x86_64-apple-darwin.zip"
      sha256 "f2fef6b764f0939f9196631f50b90ac09190972d5adaf9459dc11ad6af176532"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/itsserbin/ferrum/releases/download/v0.2.1/Ferrum-x86_64-unknown-linux-gnu.zip"
      sha256 "f2640a7f75bfe256b9b2ab4c5b349255ff2789ca9114a3ef2d1de6c5b4a8baf9"
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
