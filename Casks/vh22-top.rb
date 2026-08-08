cask "vh22-top" do
  version "1.1.1"
  sha256 "d89e48e4604d6c64bf43f7e2b01d92a6f1570582a644f5b334e56f98cdba2379"

  url "https://github.com/aelder/walled-garden-hasher/releases/download/v#{version}/walled-garden-hasher-v#{version}-macos-arm64.tar.gz"
  name "The Walled Garden Hasher"
  desc "VerusHash 2.2 miner for Apple silicon"
  homepage "https://github.com/aelder/walled-garden-hasher"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  command_wrapper "vh22-top",
                  executable: "#{staged_path}/walled-garden-hasher-v#{version}-macos-arm64/vh22-top",
                  env:        { "VH22_NEWS" => "#{staged_path}/walled-garden-hasher-v#{version}-macos-arm64/news.md" }

  caveats <<~EOS
    vh22-top is beta software provided without warranty. Mining places the
    CPU under sustained load and increases heat and power use. Read the full
    disclaimer before use:
      https://github.com/aelder/walled-garden-hasher/blob/v#{version}/DISCLAIMER.md
  EOS
end
