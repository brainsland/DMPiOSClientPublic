# DMPClient

DMPClient iOS SDK

## Installation

### Swift Package Manager
DMPClient supports installation through SPM:
```
https://github.com/brainsland/DMPiOSClientPublic.git
```

### Manually
You can download and embed the [framework](https://github.com/brainsland/DMPiOSClientPublic/tree/main/binaries/DMPClient.xcframework) manually.

## Setup
Firstly, you need to configure DMPClient SDK by calling `setup` when the app is started, ideally at `AppDelegate`'s `didFinishLaunchingWithOptions` function:

```swift
let url = URL(string: "https://backend.com/api")!
DMP.shared.setup(projectId: "usertest", url: url, language: "tr")
```

## Logging
You can enable developer mode to get detailed logs from SDK.

```swift
DMP.shared.enableLogging(true)
```

## Tracking
SDK collects most of data automatically, like sent time, timezone, session identifier. Tracking requests through `DMP.shared` instance are explained below. Any view controller that use tracking, must call `pageView` function on its `viewDidAppear` function as explained below. This way, SDK can track page durations automatically and reuse page identifiers.

### Page View
Any page that is needed to be tracked, should use `pageView` function. When the view controller is **appeared**, this function should be called.

```swift
class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let request = PageViewRequest(
            url: "https://example.com/", canonicalUrl: "", title: "", referrer: "r", infiniteScrollDepth: 0
        )
        DMP.shared.pageView(request)
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
DMP.shared.scrollPosition(12, limit: 10)
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

### Gallery
```swift
DMP.shared.gallery("https://backend.com/image.png", quantity: 10)
```

### Gallery View
```swift
DMP.shared.galleryView("https://backend.com/image.png", index: 3)
```

### Video
```swift
DMP.shared.video(
    identifier: "video-id", label: "video-label",
    posterURL: "https://backend.com/image.png",
    publishedDate: Date(), // Date the video is published at.
    duration: 12 // Duration of the video.
)
```

### Video Track
```swift
DMP.shared.videoTrack(
    identifier: "video-id", label: "video-label",
    currentTime: 12 // Current time of the video is playing.
)
```
