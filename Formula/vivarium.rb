class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.5.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "841796c16668f41bb7730735b7d54cccc7330b2660cd274aafa83f12b7053705"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.5.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "e6ec0cadf2f04ecbdb072d10a40b3991615298d7fa8c1710e3ef670d52b7be24"
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
