import Foundation
@testable import movies

class SearchRepositoryMock: SearchRepositoryProtocol {
    
    
    
    func searchMovies(query: String) async throws -> [MovieSerie] {
        return [MovieSerie(id: 1, title: "title1", posterPath: nil, overview: "overview1", voteAverage: 1.0)]
    }
    
    func searchSeries(query: String) async throws -> [MovieSerie] {
        return [MovieSerie(id: 2, title: "title2", posterPath: nil, overview: "", voteAverage: 2.0)]
    }
    
    func listTopRated() async throws -> [MovieSerie] {
        return []
    }
    
    
}
