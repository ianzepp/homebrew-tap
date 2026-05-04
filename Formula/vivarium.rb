class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v2.1.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "7de67f6e9db5637473fb5dea4b6f7d0e97d68e2ad3b0b92558c5f1d5bad9aded"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v2.1.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "69b2c5ab395368cc05f74f5e416e2c5b0e1cfb1254ea3c79f3cb54d12824788c"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
    assert_match "send", shell_output("#{bin}/vivi --help")
  end
end
