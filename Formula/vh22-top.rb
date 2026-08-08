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

  def caveats
    <<~EOS
      vh22-top is beta software provided without warranty. Mining places the
      CPU under sustained load and increases heat and power use. Read the full
      disclaimer before use:
        https://github.com/aelder/walled-garden-hasher/blob/v#{version}/DISCLAIMER.md
    EOS
  end

  test do
    assert_path_exists pkgshare/"news.md"

    wrapper = (bin/"vh22-top").read
    assert_match "VH22_NEWS", wrapper
    assert_match (pkgshare/"news.md").to_s, wrapper
    assert_match version.to_s, shell_output("#{bin}/vh22-top --version")
  end
end
