class Vivarium < Formula
  desc "Local-first IMAP email sync for LLMs"
  homepage "https://github.com/ianzepp/vivarium"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ianzepp/vivarium/releases/download/v1.5.0/vivi-aarch64-apple-darwin.tar.gz"
      sha256 "ea6fbf5a44c09a1df44e18e243f9281a211915faa46a65cf41b5bca9092c560a"
    else
      url "https://github.com/ianzepp/vivarium/releases/download/v1.5.0/vivi-x86_64-apple-darwin.tar.gz"
      sha256 "eb1e179513f334cb93507f3fb863d814b5558d6dcb2d9ff5f3b9040fe0dcfa9f"
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
