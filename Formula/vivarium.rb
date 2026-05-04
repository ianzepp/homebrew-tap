class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v2.1.1/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "5b64e2d40d04442ad6c7898d20efde76365b67933ddff9df1babe60e812936c3"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v2.1.1/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "02a85c8d3696edca31e9a756d7ff4ce9002722e0ede55901e8ed3e8afb5f3e4e"
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
