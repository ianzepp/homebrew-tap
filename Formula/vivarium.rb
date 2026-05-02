class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.1/vivarium-aarch64-apple-darwin.tar.gz"
      sha256 "bf2a1163fc6cff11d4cbdaab29c788f8e1cde67cbe306cf4729b7fa748dac99b"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.1/vivarium-x86_64-apple-darwin.tar.gz"
      sha256 "5c0bc04f804eda5fa147695e482efc7a6df72633378f5c29e296e69209b7b329"
    end
  end

  def install
    bin.install "vivarium"
  end

  test do
    assert_match "vivarium", shell_output("#{bin}/vivarium --help")
  end
end
