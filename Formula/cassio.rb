class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/cassio/releases/download/v0.4.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "e20b2bf073fea33660daf07043b7c0fec1aa6e49605b19f12cff5fd157246240"
    else
      url "https://github.com/ianzepp/cassio/releases/download/v0.4.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "5f2b8d63996067135ef641a0af9d932c40e0fab2e2251ba67669203fb45d33b8"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
