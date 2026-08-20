class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v8.0.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "7aa15a8890465988292aa005fadb1f1e2c7981b713f3000a07b80cd1bb572841"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v8.0.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "de610354a855fa988f0713d8d2d097bf107900d662b6b0899f0d93791606d126"
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
