//
//  VideoController.swift
//  artblock
//
//  Created by betül s on 2021-06-15.
//

import UIKit
import AVKit
import AVFoundation
import PlayerKit
import HCVimeoVideoExtractor
import Combine


class VideoController: UIViewController {
    
    var subscriptions = Set<AnyCancellable>()
    @IBOutlet weak var skipToArt: UIButton!
    let viewModel = ShowcaseViewModel()
    @IBOutlet weak var viewPlay: UIView!
    var player : AVPlayer?
    var url: URL!
    let playerController = AVPlayerViewController()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        HCVimeoVideoExtractor.fetchVideoURLFrom(url: url, completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in if let err = error {
                       print("Error = \(err.localizedDescription)")
                       return }
            guard let vid = video else { print("Invalid video object")
                            return }

            print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
            
        let videoURL = vid.videoURL[.quality1080p]

        let player = AVPlayer(url: (videoURL ?? URL(string: ""))!)
                DispatchQueue.main.async {
                   
                    self.playerController.player = player
                    self.present(self.playerController, animated: true) {
                        player.play()
                    }
                    }
             
            })
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnded), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }
    
    @objc private func videoDidEnded() {
        print("video ended, time to skip")
        playerController.dismiss(animated: true, completion: nil)
        NotificationCenter.default.removeObserver(self)
    }

    
}
         //func advanceToNextItem() add gesture recognizer when swiped left


