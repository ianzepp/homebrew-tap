class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.6.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "dfb3e9bd4572c7f9ef40e2dd75163953343fc1ccec5aed821101079473aa2b76"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.6.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "c2b8d260c72bc8f0c42df19a5abc1229a7c7b65da2067e35449c57f1116925f7"
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
