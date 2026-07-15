class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v5.4.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "9d5d6f5cc576b1321867d22a0d39679402c0eab28d847feae95d1f5e1aacea4a"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v5.4.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "e040cdca93e7060778c034ab00d7b6d052a4a7f1919f8f9355446d0b8c32bde7"
    end
  end

  def install
    bin.install "vivi", "vivi-pty"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
    assert_match version.to_s, shell_output("#{bin}/vivi-pty --version")
    assert_match "exec", shell_output("#{bin}/vivi --help")
    assert_match "agent", shell_output("#{bin}/vivi --help")
    assert_match "poll", shell_output("#{bin}/vivi agent --help")
    assert_match "send", shell_output("#{bin}/vivi exec --help")
  end
end
