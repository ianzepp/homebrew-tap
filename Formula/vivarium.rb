class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v3.0.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "83bae9f71d833eaf140ddf4766e6e65afcf0528b41e9e292036afd0cee757588"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v3.0.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "051d9bca7a8042da65ec144ae73461cd541243abedc842b5253e7f57d15692dd"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
    assert_match "exec", shell_output("#{bin}/vivi --help")
    assert_match "send", shell_output("#{bin}/vivi exec --help")
  end
end
