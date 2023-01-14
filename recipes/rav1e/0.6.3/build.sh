#!/bin/bash

export RUSTFLAGS="-C target-cpu=nocona"
cargo build --release
cargo install --path . --root=${PREFIX}
#cargo cbuild --release --library-type cdylib
cargo cinstall --release --prefix=${PREFIX} --library-type cdylib

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
rm -f ${PREFIX}/{.crates.toml,.crates2.json}
