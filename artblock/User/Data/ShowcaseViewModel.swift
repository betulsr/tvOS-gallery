//
//  ImagesViewModel.swift
//  artblock
//
//  Created by betül s on 2021-05-28.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Showcase: Identifiable, Codable {
    @DocumentID var id: String?
    var createdDate: Timestamp?
    var linkedTo: String?
    var artworkUrls: [String]?
    
    enum CodingKeys: String, CodingKey {
        case createdDate
        case linkedTo
        case artworkUrls
    }
}

class ShowcaseViewModel: ObservableObject {
    @Published var showcase: Showcase?
    
    var _docId = UserDefaults.standard.string(forKey: "docId")
    var deviceId = UIDevice.current.identifierForVendor?.uuidString as Any
    
    var docId: String {
        get { return _docId! }
    }
    
    func addUser(){
        if (_docId == nil) {
            _docId = deviceId as! String + "-" + String(Int.random(in: 1...10000000));
            UserDefaults.standard.set(docId, forKey: "docId")
            Firestore.firestore().collection("TV-Link").document(docId).setData([
                "createdDate": FieldValue.serverTimestamp(),
            ])
        }
    }
   
    func fetchData() {
        Firestore.firestore().collection("TV-Link").document(docId).addSnapshotListener( { (snapshot, error) in
            print("[app] Doc loaded:",
                  snapshot?.documentID ?? "",
                  snapshot?.exists ?? false,
                  snapshot?.data() ?? "")
            try? self.showcase = snapshot?.data(as: Showcase.self)
        })
    }
}
        





