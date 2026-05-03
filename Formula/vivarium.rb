class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.6.2/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "00373b8e0ef3d61bc0ddc959fe4c14ebdc8c1805662e9f3d3911a8c814ecc260"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.6.2/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "4d028c025c2993eeb5a55d6d39cd922bd83e51f6b2cc6cb2ea33bf4ea77ca043"
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
