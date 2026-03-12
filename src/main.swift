import ElementaryUI
import Reactivity
import Foundation

// ─────────────────────────────────────────────
// MARK: – Application Entry
// ─────────────────────────────────────────────

Application(OmniSwiftApp()).mount(in: "#app")

// ─────────────────────────────────────────────
// MARK: – Root Application View
// ─────────────────────────────────────────────

@View
struct OmniSwiftApp {
    var body: some View {
        div(.style(rootContainerStyle)) {
            NavigationBar()
            HeroSection()
            FeaturesSection()
            InteractiveDemo()
            Footer()
        }
    }

    private var rootContainerStyle: [String: String] {
        [
            "min-height": "100vh",
            "background": "#0a0a0f",
            "color": "#e4e4e7",
            "font-family": "'Inter', system-ui, -apple-system, sans-serif",
            "overflow-x": "hidden",
        ]
    }
}

// ─────────────────────────────────────────────
// MARK: – Navigation Bar
// ─────────────────────────────────────────────

@View
struct NavigationBar {
    var body: some View {
        nav(.style([
            "display": "flex",
            "justify-content": "space-between",
            "align-items": "center",
            "padding": "20px 48px",
            "position": "sticky",
            "top": "0",
            "z-index": "100",
            "background": "rgba(10, 10, 15, 0.85)",
            "backdrop-filter": "blur(20px)",
            "-webkit-backdrop-filter": "blur(20px)",
            "border-bottom": "1px solid rgba(255,255,255,0.06)",
        ])) {
            // Brand
            span { "⚡ OmniSwift" }
                .attributes(.style([
                    "font-size": "1.25rem",
                    "font-weight": "800",
                    "background": "linear-gradient(135deg, #667eea, #a855f7)",
                    "-webkit-background-clip": "text",
                    "-webkit-text-fill-color": "transparent",
                    "background-clip": "text",
                ]))

            // Navigation links + CTA
            div(.style(["display": "flex", "gap": "32px", "align-items": "center"])) {
                NavLink(label: "Features")
                NavLink(label: "Demo")
                NavLink(label: "Docs")

                a { "GitHub ↗" }
                    .attributes(
                        .href("https://github.com/Kevin-Li-2025/OmniSwift"),
                        .target("_blank"),
                        .style([
                            "padding": "8px 20px",
                            "border-radius": "8px",
                            "background": "linear-gradient(135deg, #667eea, #764ba2)",
                            "color": "white",
                            "text-decoration": "none",
                            "font-size": "0.85rem",
                            "font-weight": "600",
                            "transition": "opacity 0.2s",
                        ])
                    )
            }
        }
    }
}

@View
struct NavLink {
    var label: String

    var body: some View {
        span { label }
            .attributes(.style([
                "font-size": "0.9rem",
                "color": "rgba(228,228,231,0.6)",
                "cursor": "pointer",
                "transition": "color 0.2s",
            ]))
    }
}

// ─────────────────────────────────────────────
// MARK: – Hero Section
// ─────────────────────────────────────────────

@View
struct HeroSection {
    var body: some View {
        section(.style([
            "padding": "120px 48px 80px",
            "text-align": "center",
            "position": "relative",
        ])) {
            // Ambient glow background
            div(.style([
                "position": "absolute",
                "top": "-200px",
                "left": "50%",
                "transform": "translateX(-50%)",
                "width": "800px",
                "height": "600px",
                "background": "radial-gradient(ellipse, rgba(102,126,234,0.15) 0%, rgba(168,85,247,0.08) 40%, transparent 70%)",
                "pointer-events": "none",
                "z-index": "0",
            ])) { }

            div(.style(["position": "relative", "z-index": "1"])) {
                // Badge
                span { "🚀 Swift 6.2 + WebAssembly" }
                    .attributes(.style([
                        "display": "inline-block",
                        "padding": "6px 16px",
                        "background": "rgba(102,126,234,0.12)",
                        "border": "1px solid rgba(102,126,234,0.25)",
                        "border-radius": "20px",
                        "font-size": "0.8rem",
                        "color": "#667eea",
                        "font-weight": "600",
                        "margin-bottom": "32px",
                    ]))

                // Title line 1
                h1 { "Build for the Web." }
                    .attributes(.style([
                        "font-size": "4.5rem",
                        "font-weight": "800",
                        "line-height": "1.1",
                        "margin-bottom": "8px",
                        "letter-spacing": "-0.03em",
                    ]))

                // Title line 2 (gradient)
                h1 { "Write in Swift." }
                    .attributes(.style([
                        "font-size": "4.5rem",
                        "font-weight": "800",
                        "line-height": "1.1",
                        "background": "linear-gradient(135deg, #667eea 0%, #a855f7 50%, #ec4899 100%)",
                        "-webkit-background-clip": "text",
                        "-webkit-text-fill-color": "transparent",
                        "background-clip": "text",
                        "margin-bottom": "32px",
                        "letter-spacing": "-0.03em",
                    ]))

                // Subtitle
                p { "High-performance web applications compiled to WebAssembly. SwiftUI-like declarative syntax with built-in reactivity, tiny binaries, and zero JavaScript required." }
                    .attributes(.style([
                        "font-size": "1.15rem",
                        "color": "rgba(228,228,231,0.55)",
                        "max-width": "640px",
                        "margin": "0 auto 48px",
                        "line-height": "1.7",
                    ]))

                // CTA buttons row
                div(.style(["display": "flex", "gap": "16px", "justify-content": "center"])) {
                    a { "Get Started →" }
                        .attributes(
                            .href("#demo"),
                            .style([
                                "padding": "14px 32px",
                                "border-radius": "12px",
                                "background": "linear-gradient(135deg, #667eea, #764ba2)",
                                "color": "white",
                                "text-decoration": "none",
                                "font-weight": "700",
                                "font-size": "1rem",
                                "transition": "transform 0.15s, box-shadow 0.15s",
                                "box-shadow": "0 0 30px rgba(102,126,234,0.3)",
                            ])
                        )

                    a { "View on GitHub" }
                        .attributes(
                            .href("https://github.com/Kevin-Li-2025/OmniSwift"),
                            .target("_blank"),
                            .style([
                                "padding": "14px 32px",
                                "border-radius": "12px",
                                "background": "rgba(255,255,255,0.05)",
                                "border": "1px solid rgba(255,255,255,0.1)",
                                "color": "#e4e4e7",
                                "text-decoration": "none",
                                "font-weight": "600",
                                "font-size": "1rem",
                                "transition": "background 0.2s",
                            ])
                        )
                }
            }
        }
    }
}

// ─────────────────────────────────────────────
// MARK: – Features Section
// ─────────────────────────────────────────────

@View
struct FeaturesSection {
    var body: some View {
        section(.style([
            "padding": "80px 48px",
            "max-width": "1200px",
            "margin": "0 auto",
        ])) {
            h2 { "Why OmniSwift?" }
                .attributes(.style([
                    "text-align": "center",
                    "font-size": "2.25rem",
                    "font-weight": "800",
                    "margin-bottom": "16px",
                    "letter-spacing": "-0.02em",
                ]))

            p { "Everything you need to build production-ready web apps in Swift." }
                .attributes(.style([
                    "text-align": "center",
                    "color": "rgba(228,228,231,0.5)",
                    "margin-bottom": "64px",
                    "font-size": "1.05rem",
                ]))

            div(.style([
                "display": "grid",
                "grid-template-columns": "repeat(3, 1fr)",
                "gap": "24px",
            ])) {
                FeatureCard(
                    icon: "⚡",
                    title: "Near-Native Speed",
                    description: "Compiled to WebAssembly for performance that rivals native code. No interpreter overhead."
                )
                FeatureCard(
                    icon: "🎨",
                    title: "SwiftUI-Like Syntax",
                    description: "Declarative UI with @View, @State, and reactive bindings — feels just like building for iOS."
                )
                FeatureCard(
                    icon: "📦",
                    title: "Tiny Bundles",
                    description: "Embedded Swift + wasm-opt produce binaries under 500KB. Blazing fast load times."
                )
                FeatureCard(
                    icon: "🔒",
                    title: "Type-Safe",
                    description: "Swift's powerful type system catches bugs at compile time, not at runtime in production."
                )
                FeatureCard(
                    icon: "🔄",
                    title: "Built-in Reactivity",
                    description: "Fine-grained reactivity ensures only what changes gets re-rendered. No virtual DOM needed."
                )
                FeatureCard(
                    icon: "🛠️",
                    title: "Vite-Powered Dev",
                    description: "Hot module replacement, instant builds, and a complete modern toolchain out of the box."
                )
            }
        }
    }
}

@View
struct FeatureCard {
    var icon: String
    var title: String
    var description: String

    var body: some View {
        div(.style([
            "padding": "32px",
            "background": "rgba(255,255,255,0.03)",
            "border": "1px solid rgba(255,255,255,0.06)",
            "border-radius": "16px",
            "transition": "border-color 0.3s, background 0.3s",
        ])) {
            span { icon }
                .attributes(.style([
                    "font-size": "2rem",
                    "display": "block",
                    "margin-bottom": "16px",
                ]))

            h3 { title }
                .attributes(.style([
                    "font-size": "1.15rem",
                    "font-weight": "700",
                    "margin-bottom": "10px",
                    "color": "#f4f4f5",
                ]))

            p { description }
                .attributes(.style([
                    "font-size": "0.9rem",
                    "color": "rgba(228,228,231,0.5)",
                    "line-height": "1.6",
                ]))
        }
    }
}

// ─────────────────────────────────────────────
// MARK: – Interactive Demo Section
// ─────────────────────────────────────────────

@View
struct InteractiveDemo {
    @State var count = 0

    var body: some View {
        section(.style([
            "padding": "80px 48px",
            "max-width": "900px",
            "margin": "0 auto",
        ])) {
            h2 { "Try It Live" }
                .attributes(.style([
                    "text-align": "center",
                    "font-size": "2.25rem",
                    "font-weight": "800",
                    "margin-bottom": "16px",
                    "letter-spacing": "-0.02em",
                ]))

            p { "Interactive Swift components running as WebAssembly — right in your browser." }
                .attributes(.style([
                    "text-align": "center",
                    "color": "rgba(228,228,231,0.5)",
                    "margin-bottom": "64px",
                    "font-size": "1.05rem",
                ]))

            // Counter Widget
            div(.style(cardStyle)) {
                h3 { "Reactive Counter" }
                    .attributes(.style([
                        "font-size": "1.1rem",
                        "font-weight": "700",
                        "margin-bottom": "4px",
                        "color": "#f4f4f5",
                    ]))

                p { "Fine-grained state updates — only the number re-renders" }
                    .attributes(.style([
                        "font-size": "0.8rem",
                        "color": "rgba(228,228,231,0.4)",
                        "margin-bottom": "24px",
                    ]))

                div(.style([
                    "display": "flex",
                    "flex-direction": "column",
                    "align-items": "center",
                    "gap": "24px",
                    "padding": "24px 0",
                ])) {
                    span { "\(count)" }
                        .attributes(.style([
                            "font-size": "5rem",
                            "font-weight": "800",
                            "background": "linear-gradient(135deg, #667eea, #a855f7)",
                            "-webkit-background-clip": "text",
                            "-webkit-text-fill-color": "transparent",
                            "background-clip": "text",
                            "line-height": "1",
                        ]))

                    div(.style(["display": "flex", "gap": "12px"])) {
                        button { "−" }
                            .attributes(.style(counterBtnStyle))
                            .onClick { count -= 1 }

                        button { "Reset" }
                            .attributes(.style(resetBtnStyle))
                            .onClick { count = 0 }

                        button { "+" }
                            .attributes(.style(counterBtnStyle))
                            .onClick { count += 1 }
                    }

                    p { "Each button click triggers a surgical DOM update — no diffing, no virtual DOM." }
                        .attributes(.style([
                            "font-size": "0.8rem",
                            "color": "rgba(228,228,231,0.3)",
                            "text-align": "center",
                            "max-width": "400px",
                        ]))
                }
            }

            // Code preview
            div(.style([
                "margin-top": "32px",
                "padding": "28px 32px",
                "background": "rgba(255,255,255,0.02)",
                "border": "1px solid rgba(255,255,255,0.06)",
                "border-radius": "16px",
            ])) {
                h3 { "The Swift Code" }
                    .attributes(.style([
                        "font-size": "1.1rem",
                        "font-weight": "700",
                        "margin-bottom": "4px",
                        "color": "#f4f4f5",
                    ]))

                p { "This is real Swift running as WebAssembly" }
                    .attributes(.style([
                        "font-size": "0.8rem",
                        "color": "rgba(228,228,231,0.4)",
                        "margin-bottom": "20px",
                    ]))

                pre(.style([
                    "background": "rgba(0,0,0,0.4)",
                    "padding": "24px",
                    "border-radius": "12px",
                    "overflow-x": "auto",
                    "font-size": "0.85rem",
                    "line-height": "1.7",
                    "border": "1px solid rgba(255,255,255,0.05)",
                ])) {
                    code(.style([
                        "color": "#c4b5fd",
                        "font-family": "'SF Mono', 'Fira Code', 'JetBrains Mono', monospace",
                    ])) {
                        """
                        @View
                        struct Counter {
                            @State var count = 0

                            var body: some View {
                                span { "\\(count)" }
                                button { "+" }
                                    .onClick { count += 1 }
                            }
                        }
                        """
                    }
                }
            }
        }
    }

    private var cardStyle: [String: String] {
        [
            "padding": "32px",
            "background": "rgba(255,255,255,0.02)",
            "border": "1px solid rgba(255,255,255,0.06)",
            "border-radius": "20px",
        ]
    }

    private var counterBtnStyle: [String: String] {
        [
            "width": "56px",
            "height": "56px",
            "border-radius": "14px",
            "border": "1px solid rgba(255,255,255,0.1)",
            "background": "rgba(255,255,255,0.05)",
            "color": "#e4e4e7",
            "font-size": "1.5rem",
            "cursor": "pointer",
            "transition": "background 0.15s, transform 0.1s",
            "font-family": "inherit",
        ]
    }

    private var resetBtnStyle: [String: String] {
        [
            "padding": "0 24px",
            "height": "56px",
            "border-radius": "14px",
            "border": "1px solid rgba(255,255,255,0.08)",
            "background": "rgba(255,255,255,0.03)",
            "color": "rgba(228,228,231,0.5)",
            "font-size": "0.9rem",
            "cursor": "pointer",
            "transition": "background 0.15s",
            "font-family": "inherit",
        ]
    }
}

// ─────────────────────────────────────────────
// MARK: – Footer
// ─────────────────────────────────────────────

@View
struct Footer {
    var body: some View {
        footer(.style([
            "padding": "48px",
            "text-align": "center",
            "border-top": "1px solid rgba(255,255,255,0.06)",
            "margin-top": "80px",
        ])) {
            p { "Built with Swift 💜 Compiled to WebAssembly" }
                .attributes(.style([
                    "font-size": "0.85rem",
                    "color": "rgba(228,228,231,0.35)",
                ]))

            p { "OmniSwift — by Kevin Li" }
                .attributes(.style([
                    "font-size": "0.8rem",
                    "color": "rgba(228,228,231,0.2)",
                    "margin-top": "8px",
                ]))
        }
    }
}
