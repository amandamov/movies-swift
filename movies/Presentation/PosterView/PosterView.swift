
import Foundation

import SwiftUI

struct PosterView: View {
    private let imageURL: URL?

    init(imageURL: URL?) {
        self.imageURL = imageURL
    }
    
    var body: some View {
        HStack {
            AsyncImage(
                url: imageURL,
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    },
                placeholder: {
                    ProgressView()
                }
            )
        }
    }
}

struct HeroCellView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(imageURL: MovieSerie.preview.posterURL)
    }
}

