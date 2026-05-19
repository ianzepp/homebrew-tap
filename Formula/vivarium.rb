class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.3.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "b5bb9791490d6b45b0bfc5d54b7e5cb1df652ebf88227c0b6b23d0ee4d9a7b52"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.3.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "2616d9d763a74608dadc32b863e783574685a2a0b25530408a146e1c908aa77f"
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
