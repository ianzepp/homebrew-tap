class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.12.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "5042ed8c558072248780dcb2f4497eea9030ff1c529f0700799e90a1f1f54236"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.12.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "910e43b8a58663e656f107a28508fba6f2dd284b05736d05cc30dcdd7bd70a42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.12.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e7dc05d7a4a76f2d980c783515a4161022beb4e320cfe35e92e6fe942028117"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
