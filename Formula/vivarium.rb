class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v5.1.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "cccf4cd977aa9e6d0dcec40ec6d2f821413d8775a548533c180114bdaec8a20b"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v5.1.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "dce69299719adb72d0f235af353c4355f6edddb38440cf73241e41d83ce714ce"
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
