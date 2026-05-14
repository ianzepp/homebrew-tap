class Orqa < Formula
  desc "Local coordinator for background agents organized as pods and fins"
  homepage "https://github.com/ianzepp/orqa"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/orqa/releases/download/v0.2.0/orqa-aarch64-apple-darwin.tar.gz"
      sha256 "2b898d790e0f75967075e0e1cdb01f2441a321b2b645cbdc9313aa53fe6952ee"
    end

    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.2.0/orqa-x86_64-apple-darwin.tar.gz"
      sha256 "435ce60117d468055cd631b79a5c6ef46af168a3a8b63909d645111b492e7a9a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.2.0/orqa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06fc4aacbeb593f75b60eef331f691d532f34097ecc5e6bf44400845a3e5f792"
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
