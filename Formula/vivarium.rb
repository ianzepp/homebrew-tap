class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v7.3.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "a05914d11ffe7739ae671266d33cce3715c965b8706fb92324142a23481a0065"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v7.3.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "7d399647515f7a985ce5bbc52db491694645cfd43bbfa9c33628c428723e81f6"
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
