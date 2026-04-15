class Github2md < Formula
  desc "Export GitHub issues to Markdown files"
  homepage "https://github.com/ianzepp/github2md"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ianzepp/github2md/releases/download/v0.1.0/github2md-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "7cb5598f641ce87a8079649b1f63d03005964fa569a1a17f591baec28291b7c5"
  elsif OS.mac?
    url "https://github.com/ianzepp/github2md/releases/download/v0.1.0/github2md-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "98bbb75c9c9fda157eb54f6801160af7e43776cbc192ee61b238859c380ebd88"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ianzepp/github2md/releases/download/v0.1.0/github2md-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "acafbcaffdc1602f9939f342ed8f890a3ae0bdfe33fe6431f62230869e226678"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "github2md"
  end

  test do
    assert_match "github2md", shell_output("#{bin}/github2md --help")
  end
end
