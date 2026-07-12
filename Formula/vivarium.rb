class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v5.0.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "deb54378e4bd24e70b5fec5cedfe2ed3984d2bb1f1038cf66151a155bc6e76d4"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v5.0.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "0c5bf0c2292f7165adfb7d9507a8a8408ce03509d4d1840847d060ea7b9f1f93"
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
