class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.14.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "5271daeee9c9e5aa4991875b4bfe666da444a62e9d271a930eeff5d25ed83614"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.14.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "b7596d748fbb4bfdb55781f8e6eea2c4b2ad6fa7c8bb2dfe3201da712430ea5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.14.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc5792b1be58cac1d487e979c287259485e0902b5a8c104d37a210746a35e67d"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
