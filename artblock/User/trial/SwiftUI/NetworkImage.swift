import SwiftUI
import Kingfisher
import UIKit

public struct NetworkImage: SwiftUI.View {

 
  @State private var image: UIImage? = nil
    @ObservedObject var viewModel = ShowcaseViewModel()

    public let imageURL: URL?
    public let placeholderImage: UIImage
    public let animation: Animation = .easeIn

  public var body: some SwiftUI.View {
    Image(uiImage: image ?? placeholderImage)
      .resizable()
      .onAppear(perform: loadImage)
      .transition(.opacity)
        .aspectRatio(contentMode: .fit)
      .id(image ?? placeholderImage)
  }

  private func loadImage() {
    guard let imageURL = imageURL, image == nil else { return }
    KingfisherManager.shared.retrieveImage(with: imageURL) { result in
      switch result {
      case .success(let imageResult):
        withAnimation(self.animation) {
          self.image = imageResult.image
        }
      case .failure:
        break
      }
    }
  }
}

#if DEBUG
// swiftlint:disable:next type_name
struct NetworkImage_Previews: PreviewProvider {
  static var previews: some SwiftUI.View {
    //ForEach(viewModel.showcase?.artworkUrls ?? [], id: \.self) { art in
    NetworkImage(imageURL: URL(string: "https://firebasestorage.googleapis.com/v0/b/sam-artblock.appspot.com/o/rec.jpg?alt=media&token=16207ea1-8bec-4cde-ad2e-f6a6efa04e00")!,
                 placeholderImage: UIImage(imageLiteralResourceName: "logo4"))
  }
  //}
}
#endif
