class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v2.2.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "b20ed1f9574a1ec54c208b1244c6b2be27f695ff8994c20bc83876c91e9e4a0b"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v2.2.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "6c4284e632bc34d080efce5c1b75b45dab6174717c014c809d8d137373e6517a"
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
