class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.7.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "06e285adc29feffa3a28797b2281a9588c8505be8ead5edd350bdf30cd7a2a7b"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.7.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "4997ea9a6f02b5977dfe2125d402c43d29ed8a4c921caa5fe21b2ed550452333"
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
