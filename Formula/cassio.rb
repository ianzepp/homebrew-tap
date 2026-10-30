class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v1.0.1/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "c908a0e914c4c905b1574ecd680a5c515c5a735a123d691c0f6fae5fbbce6287"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v1.0.1/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "483cdbdb2d57698b51624649cf2633a847710db0f2eda9abe13c750639a3149f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v1.0.1/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3097c6c16f883c324d5011f719e4686fb0300a196cf1cabbb2dfd284eebccb3"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
