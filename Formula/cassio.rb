class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.10.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "e00982a4a33f925108d5947b228bfda217ba482dbb3f80d5d699c9a2d2e0a953"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.10.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "3384f9afab2a741794ab74e3c339431db291dc71f0705f3762b2d5b4c127aeff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.10.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ff047031aafe5080c95ee4a818dfda4ceb4434fde2c00547bb98e049498da8e"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
