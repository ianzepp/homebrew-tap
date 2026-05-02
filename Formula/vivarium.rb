class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.2/vivarium-aarch64-apple-darwin.tar.gz"
      sha256 "8245004bf987669ff75fdd615eb1a430fc8eb1390ec8ec32a02ce67acb411cc2"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.2/vivarium-x86_64-apple-darwin.tar.gz"
      sha256 "82b5606eca312280df3ddec3f94d4a24421b4c439657b13853469e00a571e083"
    end
  end

  def install
    bin.install "vivarium"
  end

  test do
    assert_match "vivarium", shell_output("#{bin}/vivarium --help")
  end
end
