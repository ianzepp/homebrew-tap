class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.1.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "c7bc8f8a1d3a0535c164204064202935c52008f236d50d9633cbaa638db808e0"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.1.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "49919319fe13229addd6e42471284263229c63936a247c2e49413bfd7b553a0c"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
  end
end
