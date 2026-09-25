class Cue < Formula
  desc "macOS clipboard history manager (CLI/TUI/daemon)"
  homepage "https://github.com/kael-wq/cue"
  url "https://github.com/kael-wq/cue/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "71d119ec086672416f1eec9828c519c96fb6655ff140d87cccbc1c50b2e93ae8"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/cue"
  end

  test do
    assert_match "cue 0.1.0", shell_output("#{bin}/cue --version")
  end
end
