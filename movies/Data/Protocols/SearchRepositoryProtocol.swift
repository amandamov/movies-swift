import Foundation

protocol SearchRepositoryProtocol {
    func searchMovies(query: String) async throws -> [MovieSerie]
    func searchSeries(query: String) async throws -> [MovieSerie]
    func listTopRated() async throws -> [MovieSerie]
}
