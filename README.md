# Homebrew Tap

Homebrew formulae for projects maintained by
[`aelder`](https://github.com/aelder).

## Install `vh22-top`

`vh22-top` is a VerusHash 2.2 terminal miner for Apple silicon Macs.

```bash
brew install --cask aelder/tap/vh22-top && vh22-top
```

The cask installs the verified Apple silicon release and the full ticker data
without compiling locally. The miner launches only after Homebrew reports a
successful installation. Upgrade it with:

```bash
brew upgrade --cask vh22-top
```

Project documentation, beta status, and hardware disclaimer:
[aelder/walled-garden-hasher](https://github.com/aelder/walled-garden-hasher).
