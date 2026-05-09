class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v3.2.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "7ca8d2e6e22d08acb7c58e585223a25f4d3e6d047f69f4d632b82232dfab8718"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v3.2.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "b7fb0539750f1cf2d1d8f515167910b1e8a779354e181bc5797d61495eefc833"
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
