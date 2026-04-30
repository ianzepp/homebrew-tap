class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.9.1/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "ee50b731d10c483ce8a16f2a57e620315780a48f589f0ef62c0ebf87e0c351ae"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.9.1/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "0cf3be8f2b5e25a064d72bf68fe4f9e551c6d0b0166e6b9ca2d4689bc8b23f44"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.9.1/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92f35942dc321bf2cb224f46892816f1225011629f0366db1b5619cf677ef529"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
