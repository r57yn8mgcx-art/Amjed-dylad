name: Build iOS Dylib

on: [push, workflow_dispatch]

jobs:
  build:
    runs-on: macos-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v3

      - name: Compile Dylib
        run: |
          clang -dynamiclib -fobjc-arc -isysroot $(xcrun --sdk iphoneos --show-sdk-path) -arch arm64 -framework UIKit -framework Foundation tweak.m -o background_tweak.dylib
          
      - name: Upload Dylib Artifact
        uses: actions/upload-artifact@v3
        with:
          name: background_tweak_ready
          path: background_tweak.dylib
