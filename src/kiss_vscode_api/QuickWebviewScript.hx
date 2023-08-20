package kiss_vscode_api;

import kiss.KissInterp;
import kiss_vscode_api.WebviewExterns;

enum QuickWebviewMessage {
    RunScript(hscript:String);
    Message(m:Any);
}

class QuickWebviewScript {
    static function main() {
        var vscode = WebviewExterns.acquireVsCodeApi();
        var interp = new KissInterp();

        interp.variables["vscode"] = vscode;
        interp.variables["window"] = WebviewExterns.window;
        interp.variables["document"] = WebviewExterns.window.document;

        WebviewExterns.window.addEventListener("message", event -> {
            switch (event.data) {
                case RunScript(hscript):
                    interp.evalHaxe(hscript);
                default:
            }
        });

    }
}