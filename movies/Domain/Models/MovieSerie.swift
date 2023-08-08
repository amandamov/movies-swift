import Foundation

struct MovieSerie: Identifiable, Hashable {
    let id: Int
    let title: String
    let posterPath: String?
    let overview: String
    let voteAverage: Double
}

extension MovieSerie {
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")
    }
}

extension MovieSerie {
    static var preview: MovieSerie {
        MovieSerie(
            id: 0,
            title: "Barbie",
            posterPath: "iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
            overview: "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.",
            voteAverage: 5.0
        )
    }
}
