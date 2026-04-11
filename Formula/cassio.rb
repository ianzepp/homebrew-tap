class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/cassio/releases/download/v0.5.1/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "6365418021530ae5b5605dd5fe78e7d967a5e1d8d61b893cdcf5f2a2a37183d6"
    else
      url "https://github.com/ianzepp/cassio/releases/download/v0.5.1/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "ff7cc277305c98f0f32b3c42938bdae5fba0f9afe6f5fc2d530f5e9c746a4281"
    end
  end

  on_linux do
    url "https://github.com/ianzepp/cassio/releases/download/v0.5.1/cassio-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "99b2cdfb085e949d5304f5a36e52dc8c0adab9da6f3f80fdee357ce6fce78283"
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
