class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.4.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "aee2fcfabd9cb4e8daf7042dad5401c2c9ef443858a0781b578f22b8b2572918"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.4.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "d23c9a15397a1a1278b83a9759321aa3994e3d24cbef82c1fae563e332047ffa"
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
