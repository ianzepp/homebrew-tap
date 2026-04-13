class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/cassio/releases/download/v0.7.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "24607e8b732e66dd0a5f641b2febb34429ee7d2837c8ac771ca9f115e9ca6024"
    else
      url "https://github.com/ianzepp/cassio/releases/download/v0.7.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "14577476916da774588fbe4b59422608368d719424d8c583ddda12130cae5336"
    end
  end

  on_linux do
    url "https://github.com/ianzepp/cassio/releases/download/v0.7.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eb62f81f9001c09d77db3930219615e6af4bf1a4983df3cc170e00f34b8cd6e7"
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
