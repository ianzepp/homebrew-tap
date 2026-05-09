class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.0.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "ad8e04fa489f6ae15360873f4471f565d7d430ea3d5d84de2bde01527935fe68"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.0.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "f94422b212e52f65dde176e7b0ad1f19b54f32f49690d42eecc471690eb926cf"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
    assert_match "exec", shell_output("#{bin}/vivi --help")
    assert_match "agent", shell_output("#{bin}/vivi --help")
    assert_match "poll", shell_output("#{bin}/vivi agent --help")
    assert_match "send", shell_output("#{bin}/vivi exec --help")
  end
end
