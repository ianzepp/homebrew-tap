class Ghostfolio < Formula
  desc "Bloomberg-terminal TUI for Ghostfolio with AI agent"
  homepage "https://github.com/ianzepp/ghostfolio-cli"
  version "0.1.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/ghostfolio-cli/releases/download/v0.1.1/ghostfolio-aarch64-apple-darwin.tar.gz"
      sha256 "7cc79b07452f3b1b2d35d9d889aae13220c90424c9be45f9807845239f6f4e56"
    else
      url "https://github.com/ianzepp/ghostfolio-cli/releases/download/v0.1.1/ghostfolio-x86_64-apple-darwin.tar.gz"
      sha256 "22706bb9ec7edd7ffac9cbcaf00bdd4c8b49bf449acda126a0a6cebffaab81f1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ianzepp/ghostfolio-cli/releases/download/v0.1.1/ghostfolio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8bb3cc1bb16214b97ad72d71980bd0e8a7e222de2a2341b22c95b9f3791eff6"
    end
  end

  def install
    bin.install "ghostfolio"
  end

  test do
    assert_match "ghostfolio", shell_output("#{bin}/ghostfolio --help")
  end
end
