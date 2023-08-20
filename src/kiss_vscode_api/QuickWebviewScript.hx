package kiss_vscode_api;

import kiss.KissInterp;
import kiss.Prelude;
import kiss_vscode_api.WebviewExterns;

typedef QuickWebviewMessage = {
    type:String,
    data:Any
};

class QuickWebviewScript {
    static function main() {
        var vscode = WebviewExterns.acquireVsCodeApi();
        Prelude.printStr = s -> vscode.postMessage({type: "print", data: s});

        var interp = new KissInterp();

        var window = WebviewExterns.window;
        var document = WebviewExterns.window.document;

        interp.variables["vscode"] = vscode;
        interp.variables["window"] = window;
        interp.variables["document"] = document;

        window.addEventListener("message", event -> {
            switch (event.data.type) {
                case "runScript":
                    try {
                        interp.evalHaxe(event.data.data);
                        return;
                    } catch (e:Any) {
                        vscode.postMessage({ type: "error", data: e});
                        return;
                    }
                default:
            }
        });

    }
}