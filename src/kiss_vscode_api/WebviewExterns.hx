package kiss_vscode_api;

import js.html.Window;

typedef VSCodeAPI = {
    function postMessage(message:Any):Void;
    function getState():Any;
    function setState(state:Any):Void;
}

@:native("")
extern class WebviewExterns {
    static function acquireVsCodeApi():VSCodeAPI;
    static var window:Window;
}
