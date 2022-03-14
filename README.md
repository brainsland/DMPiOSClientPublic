# DMPClient

DMPClient iOS SDK

## Installation

### Swift Package Manager
DMPClient supports installation throught SPM:
```
https://github.com/Rashidium/DMPClientPublic.git
```

### Manually
You can download and embed the [framework](https://github.com/Rashidium/DMPClientPublic/tree/main/binaries/DMPClient.xcframework) manually.

## Setup
Before you, start you need to configure DMPClient SDK. Ideally, `setup` should be done when the app starts, eg `AppDelegate`'s `didFinishLaunchingWithOptions`:

```swift
let url = URL(string: "https://backend.com/api")!
DMP.shared.setup("usertest", url: url)
```

## Logging
You can enable developer mode to see detailed logs.
```swift
DMP.shared.enableLogging(true)
```

## Usage

### Page View
```swift
let request = PageViewRequest(
    url: "https://hurriyet.com/", canonicalUrl: "", title: "", referrer: "r",
    origin: "o", infiniteScrollDepth: 0
)
DMP.shared.pageView(request)
DMP.shared.pageView(request, info)
```

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
