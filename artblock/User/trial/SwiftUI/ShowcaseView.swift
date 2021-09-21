import SwiftUI

struct ShowcaseView: SwiftUI.View {
    var urls: [String]
    var body: some View {
        ScrollView {
                TabView {
                    ForEach(0..<urls.count) { i in
                        if(urls[i].starts(with: "https://vimeo.com")){
                            VimeoPlayer(url: urls[i])
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                        }
                        NetworkImage(imageURL: URL(string: urls[i])!,
                                 placeholderImage: UIImage(imageLiteralResourceName: "logo4"))
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        .edgesIgnoringSafeArea(.all)
    }
}


struct ShowcaseView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        ShowcaseView(urls: ["https://vimeo.com/529077349","https://pbs.twimg.com/media/EfuoEWEXgAAeOpv?format=jpg&name=large"])
    }
}
