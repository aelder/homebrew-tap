cask "vh22-top" do
  version "1.1.2"
  sha256 "5530ad8430a0f240ce2389fd88c906df774575d1dd2a3692d0c9c3e354ef42fd"

  url "https://github.com/aelder/walled-garden-hasher/releases/download/v#{version}/walled-garden-hasher-v#{version}-macos-arm64.tar.gz"
  name "The Walled Garden Hasher"
  desc "VerusHash 2.2 miner for Apple silicon"
  homepage "https://github.com/aelder/walled-garden-hasher"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  binary "walled-garden-hasher-v#{version}-macos-arm64/vh22-top"

  caveats <<~EOS
    vh22-top is beta software provided without warranty. Mining places the
    CPU under sustained load and increases heat and power use. Read the full
    disclaimer before use:
      https://github.com/aelder/walled-garden-hasher/blob/v#{version}/DISCLAIMER.md
  EOS
end
