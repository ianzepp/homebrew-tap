class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.20.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "fb83bf6ee1ab982ab4e3c91d8be8667bf989890c163e09305b364ff112487eba"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.20.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "02cda61c49a21eece622f1a4f03f31630776384e517e47a187985eb3be7c2fe1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.20.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "400f6aad483210fcad2ca2cb5f93c652ed8f2ea54c54876ba0ec82e79a21274f"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
