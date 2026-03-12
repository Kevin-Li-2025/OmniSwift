<div align="center">

# ⚡ OmniSwift

**Build for the Web. Write in Swift.**

A high-performance starter template for building web applications in Swift,  
compiled to WebAssembly and powered by [ElementaryUI](https://github.com/elementary-swift/elementary-ui).

[![Swift 6.2](https://img.shields.io/badge/Swift-6.2-F05138?logo=swift&logoColor=white)](https://swift.org)
[![WebAssembly](https://img.shields.io/badge/WebAssembly-654FF0?logo=webassembly&logoColor=white)](https://webassembly.org)
[![Vite](https://img.shields.io/badge/Vite-8.x-646CFF?logo=vite&logoColor=white)](https://vite.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

</div>

---

## Overview

OmniSwift lets you write SwiftUI-like declarative UI code that compiles to WebAssembly and runs natively in the browser — no JavaScript frameworks required.

**Key highlights:**

- 🚀 **Near-native performance** — Swift compiled to WASM, not interpreted
- 🎨 **Familiar syntax** — `@View`, `@State`, reactive bindings, just like SwiftUI
- 📦 **Tiny bundles** — Embedded Swift + `wasm-opt` produce sub-500KB binaries
- 🔒 **Type-safe** — Catch bugs at compile time, not in production
- 🔄 **Fine-grained reactivity** — No virtual DOM; only what changes re-renders
- 🛠️ **Modern tooling** — Vite dev server with HMR and instant builds

---

## Prerequisites

Before you begin, make sure you have the following installed:

| Tool | Version | Installation |
|------|---------|-------------|
| **Swift** | 6.2+ | [swift.org/install](https://www.swift.org/install/) or `brew install swift` |
| **Swift WASM SDK** | 6.2.4+ | See [SDK setup](#install-the-swift-wasm-sdk) below |
| **Node.js** | 18+ | [nodejs.org](https://nodejs.org) or `brew install node` |
| **npm** | 9+ | Included with Node.js |

### Install the Swift WASM SDK

```bash
# List available SDKs
swift sdk list

# Install the WebAssembly SDK (if not already installed)
swift sdk install https://github.com/nicklama/swift-6.2.4-RELEASE_wasm.artifactbundle.tar.gz

# Verify installation
swift sdk list
# Should show: swift-6.2.4-RELEASE_wasm
```

> **Note:** The exact SDK URL may differ depending on your platform. Check the [SwiftWasm releases](https://github.com/nicklama) or [swift.org WASM guide](https://www.swift.org/documentation/articles/static-linux-getting-started.html) for the latest.

---

## Quick Start

Get up and running in **3 steps**:

```bash
# 1. Clone the repository
git clone https://github.com/Kevin-Li-2025/OmniSwift.git
cd OmniSwift

# 2. Resolve Swift packages & install npm dependencies
swift package resolve
npm install

# 3. Start the dev server
npm run dev
```

The app will open at **http://localhost:5173** with hot-reload enabled.

---

## Project Structure

```
OmniSwift/
├── src/
│   ├── main.swift          # Swift application entry point & UI components
│   ├── main.js             # JavaScript bootstrap (loads WASM module)
│   └── assets/             # Static assets (images, fonts, etc.)
├── index.html              # HTML shell with loading UI
├── Package.swift           # Swift Package Manager manifest
├── package.json            # npm dependencies & scripts
├── vite.config.js          # Vite configuration with WASM plugin
└── .gitignore
```

### How It Works

```
┌──────────────┐    swift build     ┌──────────────┐    vite serve    ┌─────────────┐
│  main.swift  │ ──────────────────▶│  .wasm file  │ ───────────────▶│   Browser   │
│  (Swift UI)  │   (compile to      │  (optimized) │  (bundle + HMR) │  (runs WASM)│
└──────────────┘    WebAssembly)    └──────────────┘                  └─────────────┘
```

1. **You write** declarative Swift UI code using `@View` and `@State`
2. **Vite plugin** compiles Swift → WebAssembly via the SwiftWasm SDK
3. **Browser loads** the optimized `.wasm` binary and mounts your app to the DOM
4. **Reactivity system** handles state changes with surgical DOM updates

---

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| **Dev** | `npm run dev` | Start Vite dev server with HMR at `localhost:5173` |
| **Build** | `npm run build` | Production build with Embedded Swift + `wasm-opt` |
| **Preview** | `npm run preview` | Preview the production build locally |
| **Clean** | `npm run clean` | Remove build artifacts (`dist/`, `.build/debug`, `.build/release`) |

---

## Writing Your First Component

Create components using the familiar `@View` macro:

```swift
import ElementaryUI
import Reactivity

@View
struct Greeting {
    @State var name = "World"

    var body: some View {
        div {
            h1 { "Hello, \(name)!" }

            input()
                .attributes(.placeholder("Your name"), .value(name))
                .onInput { name = $0 }
        }
    }
}
```

### Component Patterns

**Static component with props:**
```swift
@View
struct Badge {
    var label: String
    var color: String

    var body: some View {
        span { label }
            .attributes(.style(["color": color, "font-weight": "bold"]))
    }
}
```

**Generic container with `@ViewBuilder`:**
```swift
@View
struct Card<Content: View> {
    var title: String
    @ViewBuilder var content: Content

    var body: some View {
        div(.style(["padding": "24px", "border-radius": "12px"])) {
            h3 { title }
            content
        }
    }
}
```

**Event handling:**
```swift
button { "Click me" }
    .onClick { print("Tapped!") }

input()
    .onInput { newValue in /* handle input */ }
```

---

## Performance Optimization

### Production Build

The Vite config automatically applies these optimizations in production mode:

| Optimization | Development | Production |
|-------------|-------------|------------|
| **Embedded Swift SDK** | ✗ (standard SDK) | ✓ (smaller runtime) |
| **wasm-opt** | ✗ (fast iteration) | ✓ (`-Os --strip-debug`) |
| **Source maps** | ✓ | ✗ |
| **Minification** | ✗ | ✓ (esbuild) |

```bash
# Create optimized production build
npm run build

# Preview locally
npm run preview
```

### Tips for Smaller Binaries

1. **Minimize Foundation usage** — Use only what you need; `Foundation` adds significant size
2. **Prefer value types** — Structs and enums over classes for better WASM codegen
3. **Avoid string interpolation** in hot paths — use computed properties instead
4. **Keep dependencies lean** — each SPM dependency increases binary size

---

## Deployment

### Static Hosting (Recommended)

After running `npm run build`, the `dist/` folder contains a fully static site:

```bash
npm run build
# dist/ is ready to deploy
```

Deploy to any static host:
- **Vercel**: `npx vercel --prod`
- **Netlify**: Drag & drop `dist/` or connect your repo
- **GitHub Pages**: Push `dist/` to your `gh-pages` branch
- **Cloudflare Pages**: Connect repo, set build command to `npm run build`

### Docker

```dockerfile
FROM node:18-alpine AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
```

---

## Troubleshooting

<details>
<summary><b>Swift SDK not found</b></summary>

Ensure the SDK is installed and the `SWIFT_SDK_ID` matches:

```bash
swift sdk list
# Verify "swift-6.2.4-RELEASE_wasm" appears

# If not, install it:
swift sdk install <URL_TO_SDK>
```

Also verify Swift is on your PATH:
```bash
which swift
swift --version
```
</details>

<details>
<summary><b>npm install fails with "elementary-ui-browser-runtime"</b></summary>

The browser runtime is resolved from Swift packages. Run `swift package resolve` first:

```bash
swift package resolve
npm install
```
</details>

<details>
<summary><b>WASM compilation is slow</b></summary>

First builds download and compile dependencies. Subsequent builds are incremental and much faster. To speed things up:

- Use `npm run dev` during development (no `wasm-opt`)
- Avoid adding unnecessary SPM dependencies
- The `.build` directory caches compiled modules
</details>

<details>
<summary><b>Dev server shows blank page</b></summary>

Check the browser console for errors. Common causes:

1. **WASM MIME type** — Some servers don't serve `.wasm` with the correct MIME type. Vite handles this automatically.
2. **Browser compatibility** — Ensure you're using a modern browser (Chrome 90+, Firefox 89+, Safari 15+).
3. **Ad blockers** — Some extensions block WebAssembly execution. Try incognito mode.
</details>

---

## Tech Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **Language** | [Swift 6.2](https://swift.org) | Application logic & UI |
| **UI Framework** | [ElementaryUI](https://github.com/elementary-swift/elementary-ui) | Declarative views, reactivity |
| **Compile Target** | [WebAssembly](https://webassembly.org) | Near-native browser execution |
| **Build Tool** | [Vite 8](https://vite.dev) | Dev server, HMR, bundling |
| **Interop** | [JavaScriptKit](https://github.com/nicklama/JavaScriptKit) | Swift ↔ JavaScript bridge |

---

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-thing`)
3. Commit your changes (`git commit -m 'Add amazing thing'`)
4. Push to the branch (`git push origin feature/amazing-thing`)
5. Open a Pull Request

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Built with Swift 💜 Compiled to WebAssembly**

[⬆ Back to top](#-omniswift)

</div>
