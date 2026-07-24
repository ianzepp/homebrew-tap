class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.16.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "9319cd8a966f72caf7cf1d0e5e4b3d8b91888e202afa63742e582c0b6ea9926a"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.16.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "b6155af581e0c9e6e35dea01b9e41781799447663c1a20b86574bb27f310a7f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.16.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6060cc3baaa804b11d445eee4638e37cbda412ebc36db6dcfd03ce57609d89b9"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
