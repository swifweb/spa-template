import Web

class HelloPage: PageController {
    @DOM override var body: DOM.Content {
        P("Hello page")
            .textAlign(.center)
            .body {
                Button("go back").display(.block).onClick {
                    History.back()
                }
            }
    }
}

/// Live preview works in both XCode and VSCode
/// To make it work in XCode install the `XLivePreview` app
/// To make it work in VSCode install `webber` extension
class Hello_Preview: WebPreview {
    @Preview override class var content: Preview.Content {
        Language.en
        Title("My hello preview")
        Size(100, 100)
        HelloPage()
    }
}
