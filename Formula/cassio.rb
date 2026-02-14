class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/cassio/releases/download/v0.1.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "c5d9b9396ed1b64ace3e91d48bf422083081f954eaf2c7d6fde77168f3efd4a7"
    else
      url "https://github.com/ianzepp/cassio/releases/download/v0.1.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "af5d6e905d06fed82336e539fc92f6754430c6303142d95ab09811eaa3fa194b"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
