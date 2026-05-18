class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.2.1/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "9772d75c38bf7d8e7f077665f99864a696f36d1b7f335f38ca83428b60e05b4d"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.2.1/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "97515f435c39be319a30cb07ff825633db7e660aac8f3844eaa1efdb9c3b55a3"
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
