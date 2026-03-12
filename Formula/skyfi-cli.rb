class SkyfiCli < Formula
  desc "CLI for the SkyFi Platform API"
  homepage "https://github.com/ianzepp/skyfi-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/skyfi-cli/releases/download/v0.2.0/skyfi-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ac393c614cf986502e0683f53aa04fce0a1e0f4a1ef0e8e5980efb5fcc69a229"
    else
      url "https://github.com/ianzepp/skyfi-cli/releases/download/v0.2.0/skyfi-cli-x86_64-apple-darwin.tar.gz"
      sha256 "c8934cff542881a95a07ea12380070fbc68cc4c8b02124e40dc408a130aa39ae"
    end
  end

  on_linux do
    url "https://github.com/ianzepp/skyfi-cli/releases/download/v0.2.0/skyfi-cli-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bdcff34a11f0d0c6cbb2ea4f5e788934b2ed4008eb6d7729a2a7640e346e879e"
  end

  def install
    bin.install "skyfi-cli"
  end

  test do
    assert_match "skyfi-cli", shell_output("#{bin}/skyfi-cli --help")
  end
end
