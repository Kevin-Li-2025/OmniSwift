import { runApplication } from "elementary-ui-browser-runtime";
import appInit from "virtual:swift-wasm?init";

// Loading UI management
const showLoading = () => {
    const loader = document.getElementById("loader");
    if (loader) loader.style.display = "flex";
};

const hideLoading = () => {
    const loader = document.getElementById("loader");
    if (loader) {
        loader.style.opacity = "0";
        loader.style.transition = "opacity 0.5s ease-out";
        setTimeout(() => {
            loader.style.display = "none";
        }, 500);
    }
};

const showError = (error) => {
    const loader = document.getElementById("loader");
    if (loader) {
        loader.innerHTML = `
            <div style="text-align:center;color:#ff6b6b;font-family:system-ui,sans-serif;">
                <p style="font-size:1.5rem;margin-bottom:12px;">⚠️ Launch Failed</p>
                <p style="font-size:0.9rem;opacity:0.7;max-width:400px;">${error.message || error}</p>
                <button onclick="location.reload()" style="
                    margin-top:20px;padding:10px 24px;border:1px solid rgba(255,107,107,0.4);
                    background:rgba(255,107,107,0.1);color:#ff6b6b;border-radius:8px;
                    cursor:pointer;font-size:0.9rem;
                ">Retry</button>
            </div>
        `;
    }
};

// Performance timing
const startTime = performance.now();

(async () => {
    showLoading();
    try {
        await runApplication(appInit);
        const elapsed = (performance.now() - startTime).toFixed(0);
        console.log(`✅ OmniSwift launched in ${elapsed}ms`);
        hideLoading();
    } catch (e) {
        console.error("❌ OmniSwift launch failed:", e);
        showError(e);
    }
})();
