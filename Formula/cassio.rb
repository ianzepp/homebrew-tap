class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.8.1/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "84bae1371d422fdbc174596e053d6e75da7f9f7d2e73e803cf829dfd1fe4f175"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.8.1/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "13183f56e3a5471c96faf0f188d7a69d90223e43ba6e24cec5994e507d94e77f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.8.1/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e32b8d02810ba029cd622eca1fb402faec859131c371ee402ce11eec8b48496"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
