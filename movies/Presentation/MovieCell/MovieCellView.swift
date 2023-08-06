
import Foundation

import SwiftUI

struct MovieCellView: View {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    @State private var isActive = false
    
    var body: some View {
        
        HStack(content: {
            AsyncImage(url: movie.posterURL,
                       content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 200)
            },
                       placeholder: {
                ProgressView()
            })
        })

//        NavigationStack {
//            HStack(content: {
//                AsyncImage(url: movie.posterURL,
//                           content: { image in
//                    image.resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 150, height: 200)
//                },
//                           placeholder: {
//                    ProgressView()
//                })
//                NavigationLink("More info", value: MovieMoreInfoView)
//            })
//            .navigationDestination(for: MovieMoreInfoView){ movie in
//                MovieMoreInfoView(movie: movie)
//
//            }
//        }
    }
}

struct HeroCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(
            movie: Movie(id: 0,
                         title: "Barbie",
                         poster_path: URL(string: "iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg")!,
                         overview: "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans."))
    }
}

