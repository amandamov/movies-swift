
import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let poster_path: URL
    let overview: String
}

extension Movie {
    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500/\(poster_path)")
    }
}


