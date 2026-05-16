class Orqa < Formula
  desc "Local coordinator for background agents organized as pods and fins"
  homepage "https://github.com/ianzepp/orqa"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/orqa/releases/download/v0.7.0/orqa-aarch64-apple-darwin.tar.gz"
      sha256 "1593f7baa9d9c387aed67e4fdb3ba911b347425f9e783d562c529962a6f5564a"
    end

    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.7.0/orqa-x86_64-apple-darwin.tar.gz"
      sha256 "c85e25073673d0fbb2a912da025f179f9359ca9336f84087453cf28c493ef65d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.7.0/orqa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21f411b689179e9c199a223c29b37d9f9e6d14875f1863eb134992aacef4a4a5"
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
