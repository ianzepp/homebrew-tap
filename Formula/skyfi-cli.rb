class SkyfiCli < Formula
  desc "CLI for the SkyFi Platform API"
  homepage "https://github.com/ianzepp/skyfi-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/skyfi-cli/releases/download/v0.1.0/skyfi-cli-aarch64-apple-darwin.tar.gz"
      sha256 "23beebb73560bae5cc960962307b5a3049d0e81096872a79196a27c13a66ca29"
    else
      url "https://github.com/ianzepp/skyfi-cli/releases/download/v0.1.0/skyfi-cli-x86_64-apple-darwin.tar.gz"
      sha256 "8b17f772176234aa7d1dd990ae23c4d865c95fbcb25e75a6e3040a50f802ceb9"
    end
  end

  on_linux do
    url "https://github.com/ianzepp/skyfi-cli/releases/download/v0.1.0/skyfi-cli-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4b877730e869fef49a6ed3575ea00203d616d03639670f92a2aba9cfa6587377"
  end

  def install
    bin.install "skyfi-cli"
  end

  test do
    assert_match "skyfi-cli", shell_output("#{bin}/skyfi-cli --help")
  end
end
