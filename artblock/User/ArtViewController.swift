//
//  LoopViewController.swift
//  artblock
//
//  Created by betül s on 2021-06-01.
//

import UIKit
import URLImage
import Kingfisher


class ArtViewController: UIViewController {

    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var imgView_ref: UIImageView!
    var medias = [UIImage]()
    var showcase: Showcase!
    var timer = Timer()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(showcase.artworkUrls?.count ?? 0 == 0){
            print("[app] No artwork")
        }
        imgView_ref.accessibilityLabel = "Showcase Images"
        self.showcase?.artworkUrls?.forEach{ art in
            if(art.starts(with: "https://vimeo.com") == false) {
            downloadImage(with: art) { image in
                image?.accessibilityIdentifier = "Arts"
                guard let image  = image else { return}
                self.medias.append(image)
            }
        }
    }
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: (#selector(nextImage)), userInfo: nil, repeats: true)
    }
    
    @objc func nextImage()
      {
        
        if(self.medias.count != 0){
            self.backImage.isHidden = true
        }
        UIView.transition(with: self.imgView_ref, duration: 0.3, options: .transitionCrossDissolve, animations: {
        let currentIndex = self.medias.firstIndex(of: self.imgView_ref.image ?? UIImage()) ?? -1
        var nextIndex = currentIndex + 1
        nextIndex = self.medias.indices.contains(nextIndex) ? nextIndex : 0
            self.imgView_ref.image = self.medias[nextIndex]
        })
        
      }
    
   
    public func downloadImage(with urlString : String , imageCompletionHandler: @escaping (UIImage?) -> Void){
                guard let url = URL.init(string: urlString) else {
                    print("[app] Invalid URL: ", urlString)
                    return imageCompletionHandler(nil)
                }
                let resource = ImageResource(downloadURL: url)
                
            KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                    switch result {
                    case .success(let value):
                        imageCompletionHandler(value.image)
                    case .failure:
                        print("[app] Failed to load image: ", urlString)
                        imageCompletionHandler(nil)
                    }
                }
            }

}

