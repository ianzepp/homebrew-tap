class Orqa < Formula
  desc "Local coordinator for background agents organized as pods and fins"
  homepage "https://github.com/ianzepp/orqa"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/orqa/releases/download/v0.5.0/orqa-aarch64-apple-darwin.tar.gz"
      sha256 "0f52efa2e4d176913944532a9f99d5af43c01c4091ebbbcba3ac521c5f4e9141"
    end

    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.5.0/orqa-x86_64-apple-darwin.tar.gz"
      sha256 "49835a35e7e3093f36d939da12b831e16f4f7009dfea40a93ee3524952387a03"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.5.0/orqa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "430a64c72507d9f04e2ab188c33707d36fcdc7f007c883bb5f6f529cd5d9c22d"
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
