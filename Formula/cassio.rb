class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.17.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "899518c031b64d20917f0ff0ba67a40a97e6eaba0f459cb53a3c9c4f49789b79"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.17.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "78124579c9cfeae835e8ec38592acaff79c35fce382b09c66d59208a5b03e304"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.17.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b2ad573ecc5fbc208985e41f2178cc377ffb65b923088125a5bc6f1f7110eb9"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
