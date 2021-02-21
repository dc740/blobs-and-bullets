#!/bin/bash
rm -rf demo_server/web_app
wasm-pack build --target web
echo ----- Preparing demo server on demo_server/web_app -----
mkdir -p demo_server/web_app
cp -r pkg/* static/* demo_server/web_app
rm demo_server/web_app/rust_webpack_template_bg.wasm
wasm-opt pkg/rust_webpack_template_bg.wasm -o demo_server/web_app/rust_webpack_template_bg.wasm -O4 -all -ffm --enable-simd
echo ----- Done. Run with python3 demo_server/server.py -----

