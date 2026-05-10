class Swarmceo < Formula
  desc "Local-first SwarmCEO control plane"
  homepage "https://github.com/ianzepp/swarmceo-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/swarmceo-releases/releases/download/swarmceo-cli-v1.1.0/swarmceo-1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "9c8318c788ca8c523a87cad00d558de0eee56e51b16f7119c547119b3adde2f2"
    else
      url "https://github.com/ianzepp/swarmceo-releases/releases/download/swarmceo-cli-v1.1.0/swarmceo-1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "ec9ff8ece92734c2d429bce4f8c48f956e5434f6357e9dca0bef62922dd3cb7f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ianzepp/swarmceo-releases/releases/download/swarmceo-cli-v1.1.0/swarmceo-1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43435cdbdd5f8cd0981563292fe3f660926211baae9ec65d27be2fbe4c9f7428"
    else
      odie "Unsupported platform"
    end
  end

  def install
    bin.install "swarmceo"
    bin.install "swarmceo-role"
    (pkgshare/"templates/default").install Dir["templates/default/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/swarmceo --version")
    assert_match version.to_s, shell_output("#{bin}/swarmceo-role --version")
    assert_path_exists pkgshare/"templates/default/template.toml"
  end
end
