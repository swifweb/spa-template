import Web

class WelcomePage: PageController {
    @State var clickCount = 0
    @State var clicked = false
    
    @DOM override var body: DOM.Content {
        Header {
            Div {
                H1(self.$clickCount.map { "Hello world SPA app, clicks: \($0)" })
                    .color(self.$clicked.map { $0 ? .red : .white })
                    .textAlign(.center)
                    .fontFamily(.app)
                Br()
                H4("Now you can run the world using Swift")
                    .color(.white)
                    .textAlign(.center)
                    .fontFamily(.system, .appleSystem, .sanFrancisco, .roboto, .segoeUI, .helveticaNeue, .lucidaGrande, .sansSerif)
                Button("click").onClick {
                    self.clicked = !self.clicked
                    self.clickCount += 1
                }
                Button("go to hello").onClick {
                    History.pushState(path: "hello")
                }
                Button("toggle style").onClick {
                    App.current.theme = App.current.theme == .happy ? .sad : .happy
                }
            }
            .position(.absolute)
            .display(.block)
            .top(50.percent)
            .left(50.percent)
            .transform(.translate(-50.percent, -50.percent))
            .whiteSpace(.nowrap)
            .overflow(.hidden)
        }
        .position(.fixed)
        .width(100.percent)
        .height(100.percent)
        .background(.linearGradient(angle: -30, .red/20, .green/80, .red))
    }

    override func buildUI() {
        super.buildUI()
        title = "SPA Hello world"
        metaDescription = "An awesome Swift in heart of your website"
    }
}


/// Live preview works in both XCode and VSCode
/// To make it work in XCode install the `XLivePreview` app
/// To make it work in VSCode install `webber` extension
class Welcome_Preview: WebPreview {
    @Preview override class var content: Preview.Content {
        Language.en
        Title("Initial page")
        Size(640, 480)
        // add styles if needed
        AppStyles.id(.happyStyle)
        // add here as many elements as needed
        WelcomePage()
    }
}
