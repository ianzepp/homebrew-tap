class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v7.0.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "b92041b63118fddceca8f4265cbd5e78a38dd25f09a2296a64dead5873baf500"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v7.0.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "e64556fd46cf021ee902102701db6e58e331f61d1453d0df0a0c71106797f779"
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
