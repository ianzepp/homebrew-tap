class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.18.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "7c2fe1a556e6e9a2904f4cd6966b0b62acf05a80921fcc992f5a443e6de220c6"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.18.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "5d47cd0b4fcc41fa1506166ce64f325a28ce9dc92c5a5f020384ad65a3d5dbf6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.18.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2b6cf48324e887aefb1b7281d460bdd1b0f46ac03f7f3a6fbc7b6cc415ce796"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
