class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v8.1.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "ef80517153646ecdbbcf2eca9a4f9045460c0ed6c88daaeac8a374c495263cb0"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v8.1.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "469cfed607779f4fc745d5e27ce5619fdeef55b1ea3f39d545ec965155ec4640"
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
