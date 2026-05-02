class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.0/vivarium-aarch64-apple-darwin.tar.gz"
      sha256 "34802117c2f55c1aaf81a51957c833aaa40ef08afbb5fd184d6fe56d1f257148"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.0.0/vivarium-x86_64-apple-darwin.tar.gz"
      sha256 "4bc619889f2f3ce58ec1d259d10ead5f54c44ee7f53508b92b3aeba0a14b6471"
    end
  end

  def install
    bin.install "vivarium"
  end

  test do
    assert_match "vivarium", shell_output("#{bin}/vivarium --help")
  end
end
