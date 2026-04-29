class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.8.2/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "25d8af47c4332756aa65de3aae2424f593afafac5aee75c2a3e21bf25e0a0fd8"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.8.2/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "57ff3417836f54c58d43bf479486a64f63e1c6a41d840ea41f1b1edb529a8ea1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.8.2/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a91a2b5be7ebe4d1128256deb64e001fb62962569b20d402fde6b36af41d3fb9"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
