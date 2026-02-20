class Ferrum < Formula
  desc "A GPU-accelerated terminal emulator"
  homepage "https://github.com/itsserbin/ferrum"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/itsserbin/ferrum/releases/download/v0.2.0/Ferrum-aarch64-apple-darwin.zip"
      sha256 "d730f1cfca72e45e14423801e283ab453adfc398be40e259f22be9996a163753"
    end
    if Hardware::CPU.intel?
      url "https://github.com/itsserbin/ferrum/releases/download/v0.2.0/Ferrum-x86_64-apple-darwin.zip"
      sha256 "3e3fac53d011f8e129e28ec03f4db64d4ae80e5c8bd3a3be9caed148158154c1"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/itsserbin/ferrum/releases/download/v0.2.0/Ferrum-x86_64-unknown-linux-gnu.zip"
      sha256 "7e6b69550cd88cb4545170114e14b2b995ad7c754e4f03675fc109b0880ad20c"
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
