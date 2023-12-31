import Foundation

struct Movie: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let poster_path: String?
    let overview: String
    let vote_average: Double
}

extension Movie {
    func toMovieSerie() -> MovieSerie {
        MovieSerie(
            id: id,
            title: title,
            posterPath: poster_path,
            overview: overview,
            voteAverage: vote_average
        )
    }
}

