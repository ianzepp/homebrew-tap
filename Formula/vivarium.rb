class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v3.1.1/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "eb147978448d7fab6c751638a2cd0778ef4bf8ff6ad6868fb4841a160cbac882"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v3.1.1/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "22b1b4038e4fa70608033d261c9f6d1dca850f32f3215d1b45b613069f0f040d"
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
