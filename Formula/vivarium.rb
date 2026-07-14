class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v5.2.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "15efb3542e9f9ef226dd60e775aabc8ab2a313cfd2271da39631cebe18122f1e"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v5.2.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "9a6f75948f63da5872a9b34dbe49566e124dc3c2f0ee6eea30a795bc8c5b0a75"
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
