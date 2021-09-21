//
//  VimeoPlayer.swift
//  artblock
//
//  Created by betül s on 2021-08-18.
//

import SwiftUI
import UIKit
import AVKit
import HCVimeoVideoExtractor

public struct VimeoPlayer: SwiftUI.View {
    @State public var videoURL: URL?
    public let url: String
    
    
    public var body: some SwiftUI.View {
        VideoPlayer(player: AVPlayer(url: videoURL ?? URL(fileURLWithPath: "")))
            .frame(height: UIScreen.main.bounds.height)
            .aspectRatio(contentMode: .fit)
            .onAppear(perform: loadVideo)
    }
    
   private func loadVideo() {
        HCVimeoVideoExtractor.fetchVideoURLFrom(url: URL(string: url) ?? URL(fileURLWithPath: "") , completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in
            if let err = error {
                print("Error = \(err.localizedDescription)")
                return
            }
            guard let vid = video else {
                print("Invalid video object")
                return
            }
            
            print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
            
            self.videoURL = vid.videoURL[.quality1080p]
            
        })
    }
}

#if DEBUG
// swiftlint:disable:next type_name
struct VimeoPlayer_Previews: PreviewProvider {
  static var previews: some SwiftUI.View {
    VimeoPlayer(url: "https://vimeo.com/529079589")
  }
}
#endif

