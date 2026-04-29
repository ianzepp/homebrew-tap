class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.8.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "e26c8a414854e223bf7a6dc6e82dd9188e041ee2a0ff5ccc45b8adb7fa30c688"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.8.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "22757073371f8e2060d5033bcb4df3e637e6c1655bfcf28d437296d541a33d6b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.8.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c95cfd72bc68c7976b11e8fdabc7743265126fffcb1a00d09233b50d28b35c38"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
