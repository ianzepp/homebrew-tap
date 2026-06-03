class Faber < Formula
  desc "Latin programming language compiler and build tool"
  homepage "https://github.com/ianzepp/faber"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ianzepp/faber/releases/download/v0.36.0/faber-v0.36.0-aarch64-apple-darwin.tar.gz"
    sha256 "76dd9826a727a5f01e45e9616aebd3b5f6702220c22103f98dd82610393bdede"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ianzepp/faber/releases/download/v0.36.0/faber-v0.36.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4da8d0486680d3f8469ffb02bd29eebde6d7761edca99f7a7da5fc9bbf68181e"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "faber"
  end

  test do
    assert_match "faber 0.36.0", shell_output("#{bin}/faber --version")
    assert_match "Usage: faber <COMMAND>", shell_output("#{bin}/faber --help")
  end
end
