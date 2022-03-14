# DMPClient

DMPClient iOS SDK

## Installation

### Swift Package Manager
DMPClient supports installation through SPM:
```
https://github.com/Rashidium/DMPClientPublic.git
```

### Manually
You can download and embed the [framework](https://github.com/Rashidium/DMPClientPublic/tree/main/binaries/DMPClient.xcframework) manually.

## Setup
Firstly, you need to configure DMPClient SDK by calling `setup` when the app is started, ideally at `AppDelegate`'s `didFinishLaunchingWithOptions` function:

```swift
let url = URL(string: "https://backend.com/api")!
DMP.shared.setup("usertest", url: url)
```

## Logging
You can enable developer mode to get detailed logs from SDK.

```swift
DMP.shared.enableLogging(true)
```

## Setting Language
You can set SDK language through `setLanguage`:

```swift
DMP.shared.setLanguage("tr")
```

## Tracking

### Page View
Any page that is needed to be tracked, should `pageView` function. PageView function returns unique page and page view identifiers which represents calling page. Initialy, when the view controller is appeared, this function will return the identifiers. **You must save that info on view controller to pass it to the sdk, when the controller is reappared.**

```swift
class ViewController: UIViewController {
    var pageViewInfo: PageViewInfo?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let request = PageViewRequest(
            url: "https://example.com/", canonicalUrl: "", title: "", referrer: "r",
            origin: "o", infiniteScrollDepth: 0
        )
        pageViewInfo = DMP.shared.pageView(request, pageViewInfo)
    }
}
```

### Page Duration
Page durations are tracked through `pageView` requests automatically through saved `PageViewInfo`. Implementing `pageView` mentioned above will be enough to get necessary functionality.

### Breadcrumb
```swift
DMP.shared.breadcrumb(breadcrumb1: "b1", breadcrumb2: "b2", breadcrumb3: "b3", breadcrumb4: "b4", breadcrumb5: "b5")
```

### Scroll Position
```swift
DMP.shared.scrollPosition(12)
```

### Track Zone
```swift
DMP.shared.trackZone(type: "z1", value: "v1")
```

### Track User
```swift
DMP.shared.trackUser(type: "u_gold", id: "123")
```

### Page Event
```swift
DMP.shared.pageEvent(category: "c", action: "a", label: "l", value: "v")
```

### Article
```swift
let request = NewsArticleRequest(
    newsUrl: "", headline: "", description: "d", section: "s",
    author1: "a1", author2: "", author3: "", image1: "i1", image2: "", image3: "",
    keywords: "ss,ss", info: "info", datePublished: "", dateModified: "", wordCount: 3
)
DMP.shared.newsArticle(request)
```
