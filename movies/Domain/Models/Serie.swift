import Foundation

struct Serie: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let poster_path: String?
    let overview: String
    let vote_average: Double
}

extension Serie {
    func toMovieSerie() -> MovieSerie {
        MovieSerie(
            id: id,
            title: name,
            posterPath: poster_path,
            overview: overview,
            voteAverage: vote_average
        )
    }
}


