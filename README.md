Apple TV Display Application
# display

The Artblock Display Apple TV App is where you get to show off your public collections and display them on your Apple TV.
What does each viewConroller do?: https://docs.google.com/document/d/1SWIfs16Nx2Y_LLiyDQHeUSCGw6VZmJb_ACvwCKq1soI/edit?usp=sharing

# Deployment:

Submission process to App Store: https://docs.google.com/document/d/1CQz12voP4eknr04uk3dDWBbRKMhQhivMFj00WRu5Qa4/edit?usp=sharing
Deployed in App Store Conect/TestFlight : https://appstoreconnect.apple.com/apps/1571312136/appstore/tvos/version/inflight

# branches:
main: StartViewController pushes to ArtViewContoller when account is linked. ArtViewController loops through only images from firebase.
dev: uses swiftUI to display images , SUIViewController.swift hosts the swiftUI, ShowcaseView.swift uses tabView as a carousel but gives an error see error in>> 
https://docs.google.com/document/d/1SWIfs16Nx2Y_LLiyDQHeUSCGw6VZmJb_ACvwCKq1soI/edit?usp=sharing

# Database:

Firestore 
Collection: TV-Link
linkedTo: user uid linked from https://sam-artblock.web.app/sync/showcase/:TV-LINK-DOC-ID-HERE
artworkUrls: showcase urls image or vimeo
createdDate: timeStamp of when doc is added to database 


# Other Projects:

Android  TV Display app: https://github.com/gcto/artblock-android-tv-app

# testing:
uses XCUItests to take screenshots, a way to compare screenshots and complete visual diffing: https://github.com/uber/ios-snapshot-test-case


# Incompatibilities with tvOS
tvOS and macOS SDK support is not part of the official Firebase product. Instead they are community supported. Details at https://github.com/firebase/firebase-ios-sdk/blob/master/README.md.
At the moment Firebase Analytics is not supported for tvOS


