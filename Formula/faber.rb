class Faber < Formula
  desc "Latin programming language compiler and build tool"
  homepage "https://github.com/ianzepp/faber"
  version "0.38.0"
  license "MIT"

  resource "faber-reference" do
    url "https://github.com/ianzepp/faber/releases/download/v0.38.0/faber-reference-0.38.0.tar.gz"
    sha256 "1393aa500a131f9c5a5ff1f1ed9eafd68e022d3875a748b984f8f07e4cd4db40"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ianzepp/faber/releases/download/v0.38.0/faber-v0.38.0-aarch64-apple-darwin.tar.gz"
    sha256 "f9506c709b2b4a1e5ee0c6a256d04c4904e44e5ea7581b6cdfd627cea1ccd662"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ianzepp/faber/releases/download/v0.38.0/faber-v0.38.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1fcb9f126d3d17e572c6461a315af494dd8590b8b550169f45c4685749f840d6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ianzepp/faber/releases/download/v0.38.0/faber-v0.38.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f6a205c4f7d6de44b38c9877c28065f0de00069e820b76e891f478d45cb28bbd"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "faber"

    resource("faber-reference").stage do
      if File.exist?("PACK.toml")
        (share/"faber"/"reference").install Dir["*"]
      else
        reference_root = Dir["faber-reference-*"].first
        odie "missing reference pack directory in tarball" unless reference_root
        (share/"faber"/"reference").install Dir[File.join(reference_root, "*")]
      end
    end
  end

  test do
    faber_bin = (bin/"faber").to_s
    assert_match version.to_s, shell_output(faber_bin + " --version")
    assert_match "reference:", shell_output(faber_bin + " explain --list")
    assert_match "functio", shell_output(faber_bin + " explain functio")
  end
end
