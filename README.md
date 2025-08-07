# Playground

This repository provides a sample macOS application for working with custom AI image models.

## AI Image Playground App

The `AIImagePlayground` folder contains a SwiftUI-based macOS app that lets users:

- Load custom Core ML image models.
- Experiment with them in a playground-style interface.
- Expose a local HTTP API for programmatic image generation.

### Build and Run

```bash
cd AIImagePlayground
swift build
```

On macOS, open the package in Xcode to run the app with a modern and responsive UI. The app also launches an API server on `http://localhost:8080`.

### API Usage

Send a `POST` request to `/generate` with JSON like:

```json
{"prompt": "a scenic landscape"}
```

The server responds with a Base64-encoded image generated from the loaded model.
