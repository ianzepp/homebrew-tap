class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.9.2/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "9fed707b6db4bb07594fc17542d84ca745e912c6e042e9cb9292e2c7c231b7dd"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.9.2/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "5e114170c37603dcdbbd12dc4677b6f30ae098bbd7b0da5bce69e11368bce60e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.9.2/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5536b32bdddd4fa8b2b21fa116b2ac0a940bc951118e7bff913e02e64692d959"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
