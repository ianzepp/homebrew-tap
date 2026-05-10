class Swarmceo < Formula
  desc "Local-first SwarmCEO control plane"
  homepage "https://github.com/ianzepp/swarmceo-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/swarmceo-cli/releases/download/v1.0.0/swarmceo-1.0.0-macos-aarch64",
          using: :nounzip
      sha256 "e4a5181862d7d92990204658eb4a2de261c0924a2f07de85ed291971cee6a379"
    else
      odie "swarmceo 1.0.0 does not provide an Intel macOS binary"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ianzepp/swarmceo-cli/releases/download/v1.0.0/swarmceo-1.0.0-linux-x86_64",
          using: :nounzip
      sha256 "f67769215f3cdf6f15991563d9350547932de235917280aa11d17f05033e3975"
    else
      odie "swarmceo 1.0.0 does not provide a Linux ARM binary"
    end
  end

  resource "default-template" do
    url "https://github.com/ianzepp/swarmceo-cli/releases/download/v1.0.0/swarmceo-template-default-1.0.0.tar.gz"
    sha256 "3f9b2b5daf2883368a91ad315a5ddbfc976f28f009dd2ae866b77c387981c86d"
  end

  def install
    bin.install cached_download => "swarmceo"
    chmod 0755, bin/"swarmceo"

    resource("default-template").stage do
      (pkgshare/"templates/default").install Dir["*"]
    end
  end

  test do
    assert_match "swarmceo", shell_output("#{bin}/swarmceo --help")
    assert_path_exists pkgshare/"templates/default/template.toml"
  end
end
