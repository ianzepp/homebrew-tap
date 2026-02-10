class Abbot < Formula
  desc "Persistent AI background daemon"
  homepage "https://github.com/ianzepp/abbot-releases"
  version "0.2.0"
  license :cannot_represent  # Non-commercial use only

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/abbot-releases/releases/download/v0.2.0/abbot-aarch64-apple-darwin.tar.gz"
      sha256 "0944effacef30e478a453fc4e011da1eeba4aeb1b88ac984c147579c4698682f"
    else
      url "https://github.com/ianzepp/abbot-releases/releases/download/v0.2.0/abbot-x86_64-apple-darwin.tar.gz"
      sha256 "2b7ba22416550b2e2b476c643d6c126fe773b1895b5f5fc3327638f66759d4df"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ianzepp/abbot-releases/releases/download/v0.2.0/abbot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c445c1dc359a4b6ab7b60a1224161f3b0e7b6af349402f8ccfd7d360204fccb2"
    end
    # Linux ARM64 not yet supported
  end

  def install
    bin.install "abbotd"
    bin.install "abbot"
    bin.install "abbot-monitor"
    bin.install "abbot-tui"
  end

  test do
    assert_match "abbotd", shell_output("#{bin}/abbotd --version")
  end
end
