class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v6.2.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "200130150b9e6ccb78afd1f1c338f703c433484fae7241ad394c4906bfb3b058"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v6.2.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "03c2c1ed86d9701223e902ad1d684bfd5605ded13fe7647a239dbb8f8e4e7cde"
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
