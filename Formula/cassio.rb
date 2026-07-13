class Cassio < Formula
  desc "Turn AI coding session logs into searchable transcripts"
  homepage "https://github.com/ianzepp/cassio"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/cassio/releases/download/v0.13.0/cassio-aarch64-apple-darwin.tar.gz"
      sha256 "2a0b84cbfe5ee2d4d9ef20c67f3d2bc20f3654780c60c23df2e928ac732fe057"
    end

    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.13.0/cassio-x86_64-apple-darwin.tar.gz"
      sha256 "5e825e78a2ecf6e80b745ff92137d928ede143ce98931d0f89e47f602695ca95"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/cassio/releases/download/v0.13.0/cassio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18390b79ee9b57eacf20e02d527664354230a2f8cddae70b21e7b6c2d2a13ba8"
    end
  end

  def install
    bin.install "cassio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cassio --version")
  end
end
