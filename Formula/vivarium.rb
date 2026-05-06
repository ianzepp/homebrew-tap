class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v2.2.1/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "75384504f2f366c8ef7515f698c982ee0609504e79fbf29149dfdfcb1baa6e24"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v2.2.1/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "a196d0df6b507a9a0fcb32d7b97d558d13765bb56cfeaddaa2c9502ad4d6d53f"
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
