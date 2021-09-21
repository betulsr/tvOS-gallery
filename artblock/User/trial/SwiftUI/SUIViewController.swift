//
//  SUIViewController.swift
//  artblock
//
//  Created by betül s on 2021-08-18.
//

import UIKit
import SwiftUI

class SUIViewController: UIViewController {
    var showcase: Showcase!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let showcaseView = ShowcaseView(urls: showcase.artworkUrls ?? [])
        let controller = UIHostingController(rootView: showcaseView)
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
    }


}
