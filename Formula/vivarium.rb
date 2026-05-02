class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.2.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "880bdee154c0e97077cd6838719ec70fcdf7eabc509e96278497efd0b7e2ba1a"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.2.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "d9e2654d84869c9dfe3092b466f3c36978b6ee540bbb1e0a569361592ef6d5a0"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
  end
end
