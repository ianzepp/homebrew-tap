class Faber < Formula
  desc "Latin programming language compiler and build tool"
  homepage "https://github.com/ianzepp/faber"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ianzepp/faber/releases/download/v0.34.0/faber-v0.34.0-aarch64-apple-darwin.tar.gz"
    sha256 "13fc76b8decf0e39f98532021976b45e9edf7e1910e318dcda61e019d491d9ea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ianzepp/faber/releases/download/v0.34.0/faber-v0.34.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6ecd9c1251a945dbde1d9f7e34b0e6642a45ca31a67b56fda5df1953e68721e6"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "faber"
  end

  test do
    assert_match "faber 0.34.0", shell_output("#{bin}/faber --version")
    assert_match "Usage: faber <COMMAND>", shell_output("#{bin}/faber --help")
  end
end
