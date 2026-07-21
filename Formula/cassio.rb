class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.15.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "1b82e9a0f781d8aeaabfca7ced39b75fd103a94e65dd8fe8b0a1cabbaefafde2"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.15.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "a3405df90408e2b941d625343290b0b946372d1cb9e1e25e82b150cbce2414f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.15.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "710557bb0b121b5e7034a9eea82ea999214e1255ffcb7f025279a4622144f0b2"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
