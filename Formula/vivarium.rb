class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.6.1/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "d180eb56c298bd4af6b3124a2de596709861b3cb1716b3a9d0ae23e1542f5344"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.6.1/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "5542b463af9962502fc810672984683fa2ef88c4c974492d88808d5411c3b17a"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
    assert_match "send", shell_output("#{bin}/vivi --help")
  end
end
