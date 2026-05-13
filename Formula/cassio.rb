class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.11.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "414912dc323eb18a6c635cc8a59801b771c9acd38417e65c8668cb16b856a555"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.11.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "ebff67e66274e889d5c83cddb447989a60cd462532a599239eb6597a8f7b6c12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.11.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcb59188ca8c084e9d5341acaf7ccb60b2bfdb273029ea5c62d2b05d2d175bab"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match "cassio", shell_output("#{bin}/cassio --help")
  end
end
