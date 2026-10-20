#!/bin/bash
set -euo pipefail

# Builds the rust-g vendored in tools/rust/rust-g for 32 bit BYOND, reusing an earlier build of the same sources
export PATH="$HOME/.cargo/bin:$PATH"
CACHE_DIR="${RUST_G_CACHE:-$HOME/.cache/ucf-rust-g}"
KEY=$(git rev-parse HEAD:tools/rust/rust-g)
CACHED="$CACHE_DIR/$KEY/librust_g.so"

mkdir -p "$CACHE_DIR"
exec 9>"$CACHE_DIR/.lock"
flock 9

if [ ! -f "$CACHED" ]; then
	if ! command -v cargo >/dev/null 2>&1; then
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
		export PATH="$HOME/.cargo/bin:$PATH"
	fi
	rustup target add i686-unknown-linux-gnu
	export CARGO_TARGET_DIR="$CACHE_DIR/target"
	mkdir -p tools/rust/rust-g/target
	(cd tools/rust/rust-g && env PKG_CONFIG_ALLOW_CROSS=1 cargo build --release --target=i686-unknown-linux-gnu --features redis_pubsub,iconforge)
	mkdir -p "$CACHE_DIR/$KEY"
	cp "$CARGO_TARGET_DIR/i686-unknown-linux-gnu/release/librust_g.so" "$CACHED"
	rm -rf "$CARGO_TARGET_DIR"
fi

mkdir -p ~/.byond/bin
cp "$CACHED" ~/.byond/bin/librust_g.so
cp "$CACHED" librust_g.so
