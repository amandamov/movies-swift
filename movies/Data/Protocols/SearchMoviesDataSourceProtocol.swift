import Foundation
import Combine

protocol SearchMoviesDataSourceProtocol {
    func searchMovies(query: String) async throws -> [Movie]
}
