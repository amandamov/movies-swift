//import Foundation
//
//import Foundation
//import SwiftUI
//
//struct TVDetailsView: View {
//    private let tv: TV
//
//    init(tv: TV) {
//        self.tv = tv
//    }
//
//    var body: some View {
//        ScrollView{
//            VStack(spacing: 30) {
//                AsyncImage(
//                    url: tv.posterURL,
//                    content: { image in
//                        image.resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 200, height: 350)
//                    },
//                    placeholder: {
//                        ProgressView()
//                    }
//                )
//                VStack (alignment: .center, spacing: 30) {
//                    Text(tv.name)
//                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
//                        .font(.largeTitle)
//                        .font(.system(size: 20))
//                    Text("Vote avarage: \(tv.vote_average, specifier: "%.1f")")
//                        .foregroundColor(.white)
//                    Text(tv.overview)
//                        .foregroundColor(.white)
//                        .fontWeight(.regular)
//                        .font(.system(size: 17))
//                        .lineSpacing(21)
//                        .tracking(2)
//                        .frame(maxWidth: 330, alignment: .center)
//                        .lineLimit(15)
//                        .padding()
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .padding()
//        .background {
//            Color("principal")
//                .edgesIgnoringSafeArea(.all)
//        }
//    }
//}

//struct TVDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TVDetailsView(tv: TV.preview)
//    }
//}

