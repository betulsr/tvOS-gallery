//
//  ScanViewController.swift
//  artblock
//
//  Created by betül s on 2021-05-24.
//

import UIKit
import Firebase
import FirebaseFirestore
import CoreImage.CIFilterBuiltins

class QRCodeViewController: UIViewController {
    var docId: String!

    @IBOutlet weak var QRView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://sam-artblock.web.app/sync/showcase/\(self.docId ?? "")"
        QRView.image = generateQRCode(Name: url)
        QRView.layer.cornerRadius = 18
        QRView.layer.borderWidth = 15
        QRView.layer.borderColor = UIColor(red: 240/255, green: 27/255, blue: 135/255, alpha: 1).cgColor //constant, primaryColor
        QRView.layer.masksToBounds = true
    }

    func generateQRCode(Name: String) -> UIImage?{
        let name_data = Name.data(using:String.Encoding.ascii)
        if let filter = CIFilter(name:"CIQRCodeGenerator"){
            filter.setValue(name_data,forKey:"inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y:3)
            if let output = filter.outputImage?.transformed(by: transform){
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}
   
    
    

