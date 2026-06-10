class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v4.4.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "52142e03f616527a119155be0deed0921ec6a23da173e12f93ccd619fd519eb6"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v4.4.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "4a5c863d12229bc9aaede3bf89e4cb8a7b9482e49b8e4e2045644b6ad132de29"
    end
  end

  def install
    bin.install "vivi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivi --version")
    assert_match "exec", shell_output("#{bin}/vivi --help")
    assert_match "agent", shell_output("#{bin}/vivi --help")
    assert_match "poll", shell_output("#{bin}/vivi agent --help")
    assert_match "send", shell_output("#{bin}/vivi exec --help")
  end
end
