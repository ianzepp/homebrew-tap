class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v6.1.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "9539e704643f586a55146960221009af9597ba544b385e68a63590d54d600a52"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v6.1.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "82656ff5fde0fc2d1543e691db250d0aca12a91c29f414af06fa7edd21d0344f"
    end
  end

  def install
    bin.install "vivi", "vivi-pty"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
    assert_match version.to_s, shell_output("#{bin}/vivi-pty --version")
    assert_match "exec", shell_output("#{bin}/vivi --help")
    assert_match "agent", shell_output("#{bin}/vivi --help")
    assert_match "poll", shell_output("#{bin}/vivi agent --help")
    assert_match "send", shell_output("#{bin}/vivi exec --help")
  end
end
