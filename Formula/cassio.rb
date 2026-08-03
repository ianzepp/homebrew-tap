class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.19.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "e2e31e2a6650dc7d226d7991d1a367263d72774383200ee6f182537f57adad86"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.19.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "eb57d10e898a146fb91fa8b496ed751bbad0c7949a2b3e54652932a88e87af22"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.19.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05371a807c0cdf7503c71e9151b7ee4fe0253027278a4d3fd4cc5d4dc09317cc"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
