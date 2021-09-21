import UIKit
import Firebase
import FirebaseFirestore
import Combine

class StartViewController: UIViewController {
    var subscriptions = Set<AnyCancellable>()
    let viewModel = ShowcaseViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.addUser()
        self.viewModel.fetchData()
        self.viewModel.$showcase.sink(receiveValue: { showcase in
            if(showcase?.linkedTo == nil) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let qrVC = storyboard.instantiateViewController(withIdentifier: "QRCodeViewController") as! QRCodeViewController
                qrVC.docId = self.viewModel.docId
                self.navigationController?.pushViewController(qrVC, animated: true)
                return
            }
            if (showcase?.artworkUrls?.count ?? 0 == 0) {
                let alert = UIAlertController(title: "No artwork found", message: "No artwork to display. Add some in the Showcase section of your Account", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let showcaseVC = storyboard.instantiateViewController(withIdentifier: "ArtViewController") as! ArtViewController
            showcaseVC.showcase = showcase
            self.navigationController?.pushViewController(showcaseVC, animated: false)
        }).store(in: &subscriptions)
    }
    }

