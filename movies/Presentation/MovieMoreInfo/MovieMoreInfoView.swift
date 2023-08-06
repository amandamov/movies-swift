import Foundation
import SwiftUI

struct MovieMoreInfoView: View {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        VStack(alignment: .center, content: {
            VStack(spacing: 45, content: {
                AsyncImage(url: movie.posterURL,
                           content: { image in
                               image.resizable()
                        .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 350)
                           },
                           placeholder: {
                               ProgressView()
                })
                VStack (alignment: .center, spacing: 30,content: {
                    Text(movie.title)
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                        .font(.system(size: 14))
                    Text(movie.overview)
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .lineLimit(10)
                })
            }).padding()
        })
    }
}

struct MovieMoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMoreInfoView(
            movie: Movie(id: 0,
                         title: "Barbie",
                         poster_path: URL(string: "iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg")!,
                         overview: "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans."))
    }
}

