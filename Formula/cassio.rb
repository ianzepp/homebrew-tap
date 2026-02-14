class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/cassio/releases/download/v0.2.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "1c84e4ca2be7c3739945d4c448e627a26f4c501a0d3a9bb41dc2d463877e01cb"
    else
      url "https://github.com/ianzepp/cassio/releases/download/v0.2.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "3a77a5c959a37e267cad07283dbeacf9f2528416d34d12c1c293cb0b04dc011d"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
