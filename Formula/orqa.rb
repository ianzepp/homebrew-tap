class Orqa < Formula
  desc "Local coordinator for background agents organized as pods and fins"
  homepage "https://github.com/ianzepp/orqa"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ianzepp/orqa/releases/download/v0.9.0/orqa-aarch64-apple-darwin.tar.gz"
      sha256 "bb1ba2fcd65d40b6bb3b48c4a65b4f95cd6ee67f11d2a2dc2092382fbd47baab"
    end

    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.9.0/orqa-x86_64-apple-darwin.tar.gz"
      sha256 "7c09d5f0dfc5b578833d3dd0901533f60a3935ca751fad620503ad33506167fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ianzepp/orqa/releases/download/v0.9.0/orqa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0bcd83ec44c19c99ecdd2b66a7bb5b40062494a3374cdc46980843e1247f90dc"
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
