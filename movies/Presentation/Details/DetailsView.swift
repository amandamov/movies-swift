import Foundation
import SwiftUI

struct DetailsView: View {
    private let item: MovieSerie
    
    init(item: MovieSerie) {
        self.item = item
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 30) {
                AsyncImage(
                    url: item.posterURL,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 350)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                VStack (alignment: .center, spacing: 30) {
                    Text(item.title)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                        .font(.system(size: 20))
                    Text("Vote avarage: \(item.voteAverage, specifier: "%.1f")")
                        .foregroundColor(.white)
                    Text(item.overview)
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .font(.system(size: 17))
                        //.multilineTextAlignment(.leading)
                        .lineSpacing(21)
                        .tracking(2)
                        .frame(maxWidth: 330, alignment: .center)
                        .lineLimit(15)
                        .padding()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background {
            Color("principal")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(item: MovieSerie.preview)
    }
}

