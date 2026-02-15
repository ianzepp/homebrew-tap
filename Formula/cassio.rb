class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/cassio/releases/download/v0.3.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "2a8a303c7dea209283e93f21720e13cf6af90bc6e5db433ca685e1fc9b3a5c5d"
    else
      url "https://github.com/ianzepp/cassio/releases/download/v0.3.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "4114a3b6032273e04ac80e928d373607eddab9da4af9d309880cd681167a2504"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
