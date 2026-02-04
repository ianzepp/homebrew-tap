class Abbot < Formula
  desc "Persistent AI background daemon"
  homepage "https://github.com/ianzepp/abbot-releases"
  version "0.1.0"
  license :cannot_represent  # Non-commercial use only

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/abbot-releases/releases/download/v0.1.0/abbot-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_ARM64_SHA256"
    else
      url "https://github.com/ianzepp/abbot-releases/releases/download/v0.1.0/abbot-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ianzepp/abbot-releases/releases/download/v0.1.0/abbot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_LINUX_X86_64_SHA256"
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
