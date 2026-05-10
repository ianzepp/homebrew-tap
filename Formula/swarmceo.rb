class Swarmceo < Formula
  desc "Local-first SwarmCEO control plane"
  homepage "https://github.com/ianzepp/swarmceo-cli"
  url "git@github.com:ianzepp/swarmceo-cli.git",
      tag:      "v1.0.0",
      revision: "960df3cffb5448938246fbb16bbebecd39d529cd"
  version "1.0.0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    (pkgshare/"templates/default").install Dir["templates/default/*"]
  end

  test do
    assert_match "swarmceo", shell_output("#{bin}/swarmceo --help")
    assert_path_exists pkgshare/"templates/default/template.toml"
  end
end
