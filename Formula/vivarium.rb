class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.1.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "220e0ad6e364796a13d786931deb449380ba0f58a3e1bc76ee4947c6058dfcee"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.1.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "521ed93c565e47f6591a8686b233bc5d7cde5cc81908b055f7b3b9f3aa154997"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
    assert_match "exec", shell_output("#{bin}/vivi --help")
    assert_match "agent", shell_output("#{bin}/vivi --help")
    assert_match "poll", shell_output("#{bin}/vivi agent --help")
    assert_match "send", shell_output("#{bin}/vivi exec --help")
  end
end
