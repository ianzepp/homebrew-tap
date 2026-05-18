class Orqa < Formula
  desc "Local coordinator for background agents organized as pods and fins"
  homepage "https://github.com/ianzepp/orqa"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/orqa/releases/download/v0.8.0/orqa-aarch64-apple-darwin.tar.gz"
      sha256 "9e16c19c7d717b776b85876ce2498cdd387c6a434dcf2680461e13ac7cc8eb6b"
    end

    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.8.0/orqa-x86_64-apple-darwin.tar.gz"
      sha256 "cef5cc42e42c0d887c3155dbc03cfcc11f0ad9ee126a5dedff8fcee3c0190391"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.8.0/orqa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c85732c66e539e2f00a27f3b58c0c9a2cc5ceb30d05fcc7169e30c8bd7446897"
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
