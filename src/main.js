import { runApplication } from "elementary-ui-browser-runtime";
import appInit from "virtual:swift-wasm?init";

(async () => {
    console.log("Launching OmniSwift...");
    try {
        await runApplication(appInit);
        console.log("OmniSwift is live!");
    } catch (e) {
        console.error("Critical Failure:", e);
    }
})();
