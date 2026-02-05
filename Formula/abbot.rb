class Abbot < Formula
  desc "Persistent AI background daemon"
  homepage "https://github.com/ianzepp/abbot-releases"
  version "0.1.1"
  license :cannot_represent  # Non-commercial use only

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/abbot-releases/releases/download/v0.1.1/abbot-aarch64-apple-darwin.tar.gz"
      sha256 "a15c4530b8046a066fbacfcca39952b34d9b492bbb34160a5b75c31fde80ee9a"
    else
      url "https://github.com/ianzepp/abbot-releases/releases/download/v0.1.1/abbot-x86_64-apple-darwin.tar.gz"
      sha256 "2b7ba22416550b2e2b476c643d6c126fe773b1895b5f5fc3327638f66759d4df"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ianzepp/abbot-releases/releases/download/v0.1.1/abbot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c445c1dc359a4b6ab7b60a1224161f3b0e7b6af349402f8ccfd7d360204fccb2"
    end
    # Linux ARM64 not yet supported
  end

  def install
    bin.install "abbot"
  end

  test do
    assert_match "abbot", shell_output("#{bin}/abbot --version")
  end
end
