package kiss_vscode_api;

import js.html.Document;
import js.node.Timers;
import kiss_vscode_api.JSDomExterns;
import haxe.Constraints;
import vscode.*;

import kiss.Prelude;

typedef QuickWebviewSetup = (Document) -> Void;
typedef QuickWebviewUpdate = (Document, Float, Function) -> Void;

@:build(kiss.Kiss.build())
class QuickWebview {}
