class Ghostfolio < Formula
  desc "Bloomberg-terminal TUI for Ghostfolio with AI agent"
  homepage "https://github.com/ianzepp/ghostfolio-cli"
  version "0.1.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/ghostfolio-cli/releases/download/v0.1.2/ghostfolio-aarch64-apple-darwin.tar.gz"
      sha256 "495a955cb0e9d6c70a87b0df574fdfc1c39ca46b1460375fa6bb41909682d82f"
    else
      url "https://github.com/ianzepp/ghostfolio-cli/releases/download/v0.1.2/ghostfolio-x86_64-apple-darwin.tar.gz"
      sha256 "d605a8a39cbc65e22044656254aba4174924418e2ba93ba82784994dfbd2596c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ianzepp/ghostfolio-cli/releases/download/v0.1.2/ghostfolio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88347c42493c7aa81f6dccde2b38ca05484e95be8290c0a093fb6cc34c7eace3"
    end
  end

  def install
    bin.install "ghostfolio"
  end

  test do
    assert_match "ghostfolio", shell_output("#{bin}/ghostfolio --help")
  end
end
