class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/cassio/releases/download/v0.5.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "c0e789834572ca0fa486242d095aa2cde93cacc8e88c8f2713c81db3df88442b"
    else
      url "https://github.com/ianzepp/cassio/releases/download/v0.5.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "f0e037837ac407a36eca385211428367e5e0c7e003e8c971710e25bc4bf7ba6f"
    end
  end

  on_linux do
    url "https://github.com/ianzepp/cassio/releases/download/v0.5.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e91cf9e48b102db42dd282015d265d64349e54f9248a8bfc57bd1ed84640d4ac"
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
