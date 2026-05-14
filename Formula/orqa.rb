class Orqa < Formula
  desc "Local coordinator for background agents organized as pods and fins"
  homepage "https://github.com/ianzepp/orqa"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/orqa/releases/download/v0.1.0/orqa-aarch64-apple-darwin.tar.gz"
      sha256 "a509505f44d4175598e293fa6e836db16e532cc5380f5e53d63661c25c64526b"
    end

    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.1.0/orqa-x86_64-apple-darwin.tar.gz"
      sha256 "ff692ed60a2046f98ca2011ffa8c2567d4f316a8d24052f403676727a78239d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.1.0/orqa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32847244ffbdacda44f3e2e39a7f7c88cfc3c4072f43a3bcc79702725be0fdb6"
    end
  end

  def install
    bin.install "orqa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orqa --version")
    assert_match "pod", shell_output("#{bin}/orqa --help")
  end
end
