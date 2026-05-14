class Orqa < Formula
  desc "Local coordinator for background agents organized as pods and fins"
  homepage "https://github.com/ianzepp/orqa"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/orqa/releases/download/v0.3.0/orqa-aarch64-apple-darwin.tar.gz"
      sha256 "05d9a2b0e8ff58aa987ec7f27525c2cc6cb43c85645b9862862edb0d88813d9a"
    end

    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.3.0/orqa-x86_64-apple-darwin.tar.gz"
      sha256 "50632ea5a2de02cac3206f58e362aa8e4adc9672e1f986944afa034a8585a4b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.3.0/orqa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6f11ffaa6127021cf4e1dc86f096c05d353b0413fac6cedef0f594da9c2da0a"
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
