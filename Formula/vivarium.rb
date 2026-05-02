class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.3/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "9c4a9582e5a5ac0c19860a1ff00ad57c67e91705936f9da2b79c69bcc19ec8ab"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.3/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "446f752702776d8b3a7e3499a311ae4529d8c8959923b554245639e22f7acf7e"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match "vivi", shell_output("#{bin}/vivi --help")
  end
end
