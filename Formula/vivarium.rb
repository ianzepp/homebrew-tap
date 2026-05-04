class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v2.0.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "0f63c1691b95b8367cb88526941c7daed2fd0a3ce81b1141d4d860f269053c80"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v2.0.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "1c7dfe611231fbca825e208a935b19ec45588556248b86678aaa2c3f2de7ee58"
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
