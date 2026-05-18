class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.2.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "f8b2ae79f0b0e45f49423ef1f4d6c80da1b52c921bf1339e79392bb3bf6fe966"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.2.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "7efbfc5fb9bc602675df0693ba83f0ca68c364cfc5fd004244a19495b1b40d05"
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
