import ElementaryUI
import Reactivity
import Foundation

// Top-level entry point
Application(OmniSwiftBoilerplate()).mount(in: "#app")

@View
struct OmniSwiftBoilerplate {
    @State var count = 0
    
    var body: some View {
        div(.style([
            "height": "100vh",
            "display": "flex",
            "flex-direction": "column",
            "justify-content": "center",
            "align-items": "center",
            "background": "linear-gradient(135deg, #667eea 0%, #764ba2 100%)",
            "color": "white",
            "font-family": "system-ui, -apple-system, sans-serif"
        ])) {
            h1 { "🚀 OmniSwift" }
                .attributes(.style([
                    "font-size": "4rem",
                    "margin-bottom": "20px",
                    "text-shadow": "0 10px 20px rgba(0,0,0,0.2)"
                ]))
            
            p { "Next-Gen Swift Web Framework" }
                .attributes(.style([
                    "font-size": "1.5rem",
                    "opacity": "0.9",
                    "margin-bottom": "40px"
                ]))
            
            div(.style([
                "background": "rgba(255,255,255,0.1)",
                "backdrop-filter": "blur(10px)",
                "padding": "30px 50px",
                "border-radius": "30px",
                "border": "1px solid rgba(255,255,255,0.2)",
                "display": "flex",
                "flex-direction": "column",
                "align-items": "center",
                "gap": "20px"
            ])) {
                span { "Counter: \(count)" }
                    .attributes(.style(["font-size": "2rem", "font-weight": "bold"]))
                
                div(.style(["display": "flex", "gap": "20px"])) {
                    button { "Decrease" }
                        .attributes(.style(buttonStyle))
                        .onClick { count -= 1 }
                    
                    button { "Increase" }
                        .attributes(.style(buttonStyle))
                        .onClick { count += 1 }
                }
            }
        }
    }
    
    private var buttonStyle: [String: String] {
        [
            "padding": "12px 24px",
            "border-radius": "15px",
            "border": "none",
            "background": "white",
            "color": "#764ba2",
            "font-weight": "bold",
            "cursor": "pointer",
            "transition": "transform 0.1s"
        ]
    }
}
