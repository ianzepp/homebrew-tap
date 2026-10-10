class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v1.0.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "888ab0b87f0f123a74eda7b0ebfd7e0bdb908c25aabc43af4c03fc1075b60d86"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v1.0.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "ec330a73a6dcff2730cf8950690e456f92ec6f28a9e70b42807b3b23793067de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v1.0.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53e6fb9bfa0c1af15b8ab385bc8929b0221b1048b97e70996407ba11a4b8628f"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
