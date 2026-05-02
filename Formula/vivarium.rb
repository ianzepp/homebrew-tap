class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.3.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "f7cdff064b66cf2fad5c261fede9371161288d8ea505e104c6cbe2d6434fa1b1"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.3.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "48466db62a15061db4bf0737617c4449bb5f830fc955f5d2234a074423bb2ef2"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
    assert_match "send", shell_output("#{bin}/vivi --help")
  end
end
