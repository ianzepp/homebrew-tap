class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v5.0.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "a2be5753768a1c7ef7331b521b9722367321939d02dbf6bd3d1ca35e9ce65868"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v5.0.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "9a9b6a80c5e9025980ea162dc1075cabf3fac475732bdb4b81cd3be8a00da4e4"
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
