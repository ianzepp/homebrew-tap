class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/cassio/releases/download/v0.6.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "700bf4e38919c989415ecb37091f65cdcbcd7f823332a55b8835f7e33b81fe55"
    else
      url "https://github.com/ianzepp/cassio/releases/download/v0.6.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "7674652b627a7b9a47b3d73eaada4fcec59da7cdefbcf3349107d41c17ebc997"
    end
  end

  on_linux do
    url "https://github.com/ianzepp/cassio/releases/download/v0.6.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "40ffbb67f91db4420732999eed97e73c54bcf546e6d6e5136de120d46d2e7c6f"
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
