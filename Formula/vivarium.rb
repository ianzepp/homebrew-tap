class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v3.2.1/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "be0971f76093ec0fb0803af1d341aa6f753f0bc726376b815cbc9928a491fac8"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v3.2.1/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "3a3ae670dfe8e5f432cedb59f376fac55b962a009e0a5d6db63e8de453a433df"
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
