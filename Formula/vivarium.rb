class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v5.3.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "996d38713c89d63b402d92e1e70fc436f2ea571f07b4ad924dfd10799671147f"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v5.3.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "43e98aa3d6ca0217ddc4103644f0193d3a1b884735852bf750d5595cf24cb84c"
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
