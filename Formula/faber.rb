class Faber < Formula
  desc "Latin programming language compiler and build tool"
  homepage "https://github.com/ianzepp/faber"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ianzepp/faber/releases/download/v0.33.0/faber-v0.33.0-aarch64-apple-darwin.tar.gz"
    sha256 "dc7131a69830414873b53e4a2b34383b583af631cfb43af540b30ef2c9e3adf6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ianzepp/faber/releases/download/v0.33.0/faber-v0.33.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "edad05ca411f237eae49d759abda73ac3f91504c3c08a8f8c1d3d37dda64ae07"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "faber"
  end

  test do
    assert_match "faber 0.33.0", shell_output("#{bin}/faber --version")
    assert_match "Usage: faber <COMMAND>", shell_output("#{bin}/faber --help")
  end
end
