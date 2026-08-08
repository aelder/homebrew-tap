class Vh22Top < Formula
  desc "VerusHash 2.2 miner for Apple silicon"
  homepage "https://github.com/aelder/walled-garden-hasher"
  url "https://github.com/aelder/walled-garden-hasher/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "56d90e04d84a788bf1b915ba041ce42c934592324fbfe80a7b5ea0ea2dd2aa6f"
  license "GPL-3.0-or-later"

  depends_on arch: :arm64
  depends_on :macos

  def install
    system "make", "build/vh22-top"

    libexec.install "build/vh22-top"
    pkgshare.install "ui/news.md"
    (bin/"vh22-top").write_env_script(
      libexec/"vh22-top",
      VH22_NEWS: pkgshare/"news.md",
    )
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vh22-top --version")
  end
end
