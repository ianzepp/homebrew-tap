class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.9.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "07dcd857ff51fbbf6e963a9113fd06eef514978886785923f7d89043052133ff"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.9.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "50f50b87105e4c3bf6cb7d9642f33719b94a24b18f01e19e33015fc33c52acac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.9.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58e13605aa1c5346db96db6a7dd4208561b3b7d5eeaa4c7cbc60f6305f1d80f3"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
