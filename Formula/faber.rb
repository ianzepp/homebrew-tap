class Faber < Formula
  desc "Latin programming language compiler and build tool"
  homepage "https://github.com/ianzepp/faber"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ianzepp/faber/releases/download/v0.35.0/faber-v0.35.0-aarch64-apple-darwin.tar.gz"
    sha256 "d044200389eff8cc6a3933fda2c302c6f4a3786be6b7d0a9e0b3ef849ab87821"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ianzepp/faber/releases/download/v0.35.0/faber-v0.35.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f1d0c1da63a961d1343832533e0bdb507010ba0d50948ed7d592c4c903cc4807"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "faber"
  end

  test do
    assert_match "faber 0.35.0", shell_output("#{bin}/faber --version")
    assert_match "Usage: faber <COMMAND>", shell_output("#{bin}/faber --help")
  end
end
