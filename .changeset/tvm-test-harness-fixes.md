---
'openzeppelin-tron-solidity': patch
---

Make the full transpile + tron-solc compile + TVM test pipeline run green
end-to-end (parallel suite: 6378 passing / 0 failing, down from 532 failing).

- **Transpile pipeline**: split the monolithic hardhat-exposed
  `contracts/mocks/WithInit.sol` (one `*WithInit` per initializable contract →
  whole-corpus import closure) into closure-bounded
  `contracts/mocks/withinit/WithInit_NN.sol` files via
  `scripts/upgradeable/split-withinit.js` (wired into `transpile.sh`), so the
  upgradeable corpus stays under the tron-solc 0.8.26 wasm memory ceiling.
  Make `transpile.sh`'s version `sed` portable (GNU-only `sed -i'' -e` left a
  stray committed `contracts/package.json-e` on macOS/BSD sed); removed the
  stray file.

- **tron-solc batches** (`tron-batches.config.cjs`): compile the peer-import
  exposed wrappers under `contracts-exposed/$_/...` (`$Math`, `$Clones`,
  `$Checkpoints`, …) — previously never compiled — plus the WithInit split,
  both closure-bin-packed to stay under the wasm ceiling.

- **TVM test harness**:
  - Add `scripts/build-tre-fork.sh` (the script `run-tests-parallel.sh` already
    referenced but was missing) — builds the patched `-oz-tron` `FullNode.jar`,
    pinned to the installed `@openzeppelin/hardhat-tron` commit.
  - `scripts/run-tests-parallel.sh`: re-raise the worker's real exit code (the
    trailing `echo` was masking failures → CI was green despite failures); prime
    each pre-spawned chain one block past genesis via `tre_mine` (fixes the
    first-deploy `getCurrentRefBlockParams` "Unable to get params" race); check
    the jar's `-oz-tron` suffix (was the stale `-oz-spike`).
  - `hardhat/tron-artifact-suffix.js`: make the hardhat-tron ethers facade
    resolve the transpiler's `Upgradeable`/`UpgradeableWithInit` renames AND
    fall back to the fully-qualified name of peer-package contracts that tests
    deploy by bare name (e.g. `ERC7913P256Verifier`).
  - `hardhat.config.js`: widen the hardhat-exposed exclude to the split
    `WithInit_*` files.

- **Dependency**: bump `@openzeppelin/hardhat-tron` to pick up three TVM bridge
  fixes (stub-provider `call` for `setCode`-deployed contracts, lossless
  `getBalance` via raw `/wallet/getaccount`, and a CodeStore `eth_getCode`
  fallback for CREATE2 deploys).
