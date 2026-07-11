class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.8.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "d1e8e7ff61ca85d6834228be7cafd2b4411e70f630d413c0713ba7f28077a221"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.8.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "2a04d8040ac049fd256b2247a29f0fd5707d33d6946a418cfc447d4018c3c96b"
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
