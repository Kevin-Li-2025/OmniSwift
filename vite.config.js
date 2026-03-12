import { defineConfig } from 'vite';
import swiftWasm from '@elementary-swift/vite-plugin-swift-wasm';

export default defineConfig(({ mode }) => {
  const isProduction = mode === 'production';

  return {
    plugins: [
      swiftWasm({
        packagePath: '.',
        targetName: 'OmniSwift',
        // Use Embedded Swift for smaller binaries in production
        useEmbeddedSDK: isProduction,
        // Optimize WASM binary in production
        useWasmOpt: isProduction,
        wasmOptArgs: isProduction ? ['-Os', '--strip-debug'] : [],
      }),
    ],

    // Dev server configuration
    server: {
      port: 5173,
      open: true,
      // Pre-transform frequently used files for faster HMR
      warmup: {
        clientFiles: ['./src/main.js', './index.html'],
      },
    },

    // Build optimizations
    build: {
      target: 'esnext',
      minify: 'esbuild',
      sourcemap: false,
      // Optimize chunk splitting
      rollupOptions: {
        output: {
          manualChunks: undefined,
        },
      },
    },

    // Dependency optimization
    optimizeDeps: {
      exclude: ['elementary-ui-browser-runtime'],
    },
  };
});
