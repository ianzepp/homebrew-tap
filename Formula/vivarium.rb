class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.2.2/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "080a09b4b228d206073cb6bc4a75df9f752d8b9cee9de01608ba12d5012a2fac"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.2.2/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "3120724aba8eede8f3a2ecd08761e83113848c9a1f722459e97567c8745a1b6b"
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
