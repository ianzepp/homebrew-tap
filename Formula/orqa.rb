class Orqa < Formula
  desc "Local coordinator for background agents organized as pods and fins"
  homepage "https://github.com/ianzepp/orqa"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/orqa/releases/download/v0.6.1/orqa-aarch64-apple-darwin.tar.gz"
      sha256 "ca4b09d0771f79ef015ead3aca9674d1b75f50186aa1bf53338e2db3eb974322"
    end

    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.6.1/orqa-x86_64-apple-darwin.tar.gz"
      sha256 "88e7761ce89b951e8c8e8b7ea08dc4c261b401f7da4f27cd981909ed09b6d554"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.6.1/orqa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73c65c905678ff32f613b29735af6a7a7f3483984ea43df2efaeffc65c11866a"
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
