class Orqa < Formula
  desc "Local coordinator for background agents organized as pods and fins"
  homepage "https://github.com/ianzepp/orqa"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/orqa/releases/download/v0.4.0/orqa-aarch64-apple-darwin.tar.gz"
      sha256 "0ddcb48de8a2444a97203248900a76845ba32a84010997c326a8b247f59f225f"
    end

    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.4.0/orqa-x86_64-apple-darwin.tar.gz"
      sha256 "6f7fcbe74ee1936ee766f6a7d427f8ab99a2d047aba381c4951cd1bc27768d83"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.4.0/orqa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f9ea290e86213d1f8f007e8a29597a850c44a2f4ec5b22987efc8fe233289ea"
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
