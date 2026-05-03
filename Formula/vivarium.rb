class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.7.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "6a41b5332e5a7f31c3fc0217ac7f3012266255c957b435c950ad2ba04cd89832"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.7.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "b274340ee1a91d103c3fb64d000176c88db98a4af660c182c6895f41fd68b864"
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
