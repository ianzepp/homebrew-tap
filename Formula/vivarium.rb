class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v3.1.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "9eed49f5ec791e118fef6f255c36f3a200a820fb037eb65d0ac766be0e3188b7"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v3.1.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "112ea7b82e8e1cfa1394421bba881ea2c08b0d53d04fadea65d16cf2dcb442bd"
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
