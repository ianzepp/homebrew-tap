class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.4/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "cbea15c9947367cc4077f192971cc01f920b3a7a1a500c9b3bcf1ecb64768c45"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.4/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "e64fe375b6cd0c698075b067cd6e91b37d38986f85c91a3446681d9dd70ed6a8"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match "vivi", shell_output("#{bin}/vivi --help")
  end
end
