class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v5.5.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "97e83ecaab2bcab926e66c8cd419ef0206c92d0f1f6499cb3c1fe89f5fb5ccb1"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v5.5.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "558ce9b164ed985a3f1d383169eaf6d32cf6e2fcf88b1fd543f2f924e9cd3a8c"
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
